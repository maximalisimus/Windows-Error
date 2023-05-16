#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import re
import pathlib
import sys

cmd_bat_start = '''@cd/d "%~dp0"
@echo off'''
cmd_bat_fine = "cmd.exe"
cmd_bat_fine_two = "pause"
cmd_setpath = "SET PATH=%CD%\;%PATH%"

cmd_set_policy = "powershell -Command Set-ExecutionPolicy RemoteSigned"

store_root = "Root"
store_ca = "CA"
store_my = "My"

cmd_addstore = "certutil -addstore"
cmd_import_cert_start = "powershell -Command Import-Certificate -FilePath"
cmd_import_cert_fine = "-CertStoreLocation Cert:\LocalMachine\\"

cmd_bat_file = pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").joinpath("cmd.bat")
cmd_addstore_file = pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").joinpath("addstore.bat")
cmd_import_cert_file = pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").joinpath("import-cert.bat")
cmd_set_policy_file = pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").joinpath("set-policy.bat")

subs = ("SUB", "CA", "R3")

is_one_cert = False

def write_store(store_file, st_file: str, data_str: str):
	with open(store_file, st_file) as f:
		f.write(data_str)

def on_store(isoutname, on_filename):
	global is_one_cert
	sub_rez = set([True if x.lower() in str(on_filename).lower() else False for x in subs])
	if isoutname:
		if not is_one_cert:
			is_one_cert = True
			write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_my}\" \"{on_filename.name}\"\n")
			write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_my}\n")
		else:
			if "Root".lower() in str(on_filename).lower():
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_root}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_root}\n")
			elif len(sub_rez) == 1 and bool(sub_rez) == True:
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_ca}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_ca}\n")
			elif len(sub_rez) == 1 and bool(sub_rez) == False:
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_root}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_root}\n")
			elif len(sub_rez) > 1:
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_ca}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_ca}\n")
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_root}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_root}\n")
			elif len(sub_rez) == 0:
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_my}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_my}\n")
			else:
				write_store(cmd_addstore_file, 'a', f"{cmd_addstore} \"{store_my}\" \"{on_filename.name}\"\n")
				write_store(cmd_import_cert_file, 'a', f"{cmd_import_cert_start} \"{on_filename.name}\" {cmd_import_cert_fine}{store_my}\n")

def main():
	cert_file = pathlib.Path('./certificate.txt').resolve()
	with open(cert_file, "r") as f:
		lines = f.readlines()
	cert_file.unlink(missing_ok=True)
	onsearch1 = 's:C'
	onsearch2 = 'CN = '
	onsearch3 = 'BEGIN CERTIFICATE'
	onsearch4 = 'END CERTIFICATE'
	fname = ''
	outname = ''
	startname = True
	startcert = False
	endcert = False
	iswrite = False
	
	if not pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").resolve().exists():
		pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").resolve().mkdir(parents=True)
	
	write_store(cmd_bat_file, 'w', f"{cmd_bat_start}\n{cmd_setpath}\n{cmd_bat_fine}\n")
	
	write_store(cmd_addstore_file, 'w', f"{cmd_bat_start}\n{cmd_setpath}\n")
	
	write_store(cmd_import_cert_file, 'w', f"{cmd_bat_start}\n{cmd_setpath}\n")
	
	write_store(cmd_set_policy_file, 'w', f"{cmd_bat_start}\n{cmd_setpath}\n{cmd_set_policy}\n{cmd_bat_fine_two}\n")
	
	outname_old = ""
	is_outname = False
	
	for item in lines:
		if onsearch1 in item and startname:
			onstart = re.search(onsearch2, item).end()
			fname = item[onstart:].replace('*','_')
			startname = False
			outname = str(fname  + '.crt').replace(onsearch2,'').replace('*','_').replace(' ','_').replace('\n','')
			outname = pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").joinpath(outname.replace(' ','_')).resolve()
			iswrite = True
		elif onsearch1 in item:
			onstart = re.search(onsearch2, item).end()
			outname = str(fname + ' ' + item[onstart:]  + '.crt').replace(onsearch2,'').replace('*','_').replace(' ','_').replace('\n','')
			outname = pathlib.Path(sys.argv[0]).parent.parent.joinpath("certs").joinpath(outname).resolve()
			iswrite = True
		if iswrite:
			if outname_old != outname:
				outname_old = outname
				is_outname = True
			else:
				is_outname = False
			
			on_store(is_outname, outname)
			
			with open(outname, 'a') as f:
				if onsearch3 in item:
					startcert = True
				if onsearch4 in item:
					startcert = False
					endcert = True
				if startcert:
					f.write(item)
				if endcert:
					endcert = False
					f.write(item)
	
	write_store(cmd_addstore_file, 'a', f"{cmd_bat_fine_two}\n")
	write_store(cmd_import_cert_file, 'a', f"{cmd_bat_fine_two}\n")

if __name__ == '__main__':
	main()
