From: Mickael Marchand <Mickael.Marchand@ujf-grenoble.fr>
Subject: Re: reiser4: mv changes mtime ?
Date: Mon, 11 Apr 2005 21:24:32 +0200
Message-ID: <425ACEF0.30507@ujf-grenoble.fr>
References: <4254F10A.7060103@ujf-grenoble.fr> <1112944858.4420.94.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms050505010503000306090401"
Return-path: <reiserfs-list-return-23850-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112944858.4420.94.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--------------ms050505010503000306090401
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

for the notice, it seems the soft lockup bug is fixed in 2.6.12-rc2-mm3
which has been running for 8 hours now without a glitch.

Cheers,
Mik

Vladimir Saveliev a =E9crit :
> Hello
>=20
> On Thu, 2005-04-07 at 12:36, Mickael Marchand wrote:
>=20
>>Hi,
>>
>>I am giving a shot at reiser4 to make rsync snapshots backups (using
>>hard links and incremental rsync).
>>this works definitely great apart from 2 minor bugs :)
>>
>>1 : it seems that mv directory/ directory2/ changes the mtime of the
>>directory. This is not the case with reiser3.
>=20
>=20
> I am not sure which is correct.
> ext2 also changes mtime when it renames a directory.
>=20
> Also, renaming directory changes its ".." entry because on rename it may
> get new parent. So, probably, updating mtime on directory rename is not
> very incorrect.=20
>=20
>=20
>> Is this intentional ?
>>(it basically breaks my recover-from-snapshots script which uses the
>>mtime ;)
>>
>>2 : this was posted on lkml today but it fits better here I guess :
>>
>>2.6.12-rc1-mm4 config at
>>http://www-fourier.ujf-grenoble.fr/~mmarcha/config-2.6.12-rc1-mm4.gz
>>
>>running on a bi-opteron (debian-amd64),
>>I got some "flushing like mad" warning messages from reiser4 (which
>>are safe apparently).
>=20
>=20
> yes, if its counter does not increase endlessly.
>=20
>=20
>>and this soft lookup BUG caused by reiser4 I think :
>>
>=20
>=20
> Have you found a test on which this soft lockup get detected 10 times in
> 10 attempts?
>=20
>=20
>>BUG: soft lockup detected on CPU#0!
>>
>>Modules linked in: ipv6 parport_pc parport eth1394 ehci_hcd uhci_hcd
>>ohci1394 ieee1394 ohci_hcd usbcore snd_intel8x0 snd_ac97_codec snd_pcm
>>snd_timer snd snd_page_alloc i2c_amd756 i2c_amd8111 i2c_isa w83781d
>>i2c_sensor i2c_core e1000
>>Pid: 25291, comm: pdflush Not tainted 2.6.12-rc1-mm4
>>RIP: 0010:[<ffffffff8021f7de>] <ffffffff8021f7de>{protect_extent_nodes+38=
2}
>>RSP: 0018:ffff81007df45678  EFLAGS: 00000202
>>RAX: ffff810015c7c5e0 RBX: ffff81007c609000 RCX: ffff81001074ba60
>>RDX: ffff81001074b220 RSI: ffff81001074b1c0 RDI: ffff81001074b210
>>RBP: 0000002000000000 R08: ffff81007df458a0 R09: ffff810044068e14
>>R10: 000000000000001c R11: ffffffff802119a0 R12: 00007fe07df455e0
>>R13: ffff81007c609004 R14: ffff81007df4565c R15: 00007fe000000001
>>FS:  00002aaaaadfeae0(0000) GS:ffffffff806e7840(0000) knlGS:0000000000000=
000
>>CS:  0010 DS: 0018 ES: 0018 CR0: 000000008005003b
>>CR2: 00002aaaaaac2000 CR3: 000000009bc83000 CR4: 00000000000006e0
>>
>>Call Trace:<ffffffff8021f7da>{protect_extent_nodes+378}
>><ffffffff8021c00e>{extent_size+30}
>>       <ffffffff801f5df9>{txnh_get_atom+41}
>><ffffffff8021ffd2>{alloc_extent+562}
>>       <ffffffff8020a0bc>{plugin_by_unsafe_id+28}
>><ffffffff80220bd1>{item_length_by_coord+17}
>>       <ffffffff801f8a4f>{handle_pos_on_twig+351}
>><ffffffff801fabc6>{flush_current_atom+2022}
>>       <ffffffff801f7aca>{flush_some_atom+458}
>><ffffffff801a2993>{generic_sync_sb_inodes+723}
>>       <ffffffff8014cc50>{keventd_create_kthread+0}
>><ffffffff80203b85>{reiser4_sync_inodes+229}
>>       <ffffffff801a2bd9>{writeback_inodes+137}
>><ffffffff8016012c>{background_writeout+124}
>>       <ffffffff80160c10>{pdflush+0} <ffffffff80160d4c>{pdflush+316}
>>       <ffffffff801600b0>{background_writeout+0}
>><ffffffff8014cec9>{kthread+217}
>>       <ffffffff80133160>{schedule_tail+64} <ffffffff8010f59b>{child_rip+=
8}
>>       <ffffffff8014cc50>{keventd_create_kthread+0}
>><ffffffff8014cdf0>{kthread+0}
>>       <ffffffff8010f593>{child_rip+0}
>>
>>Please CC-me in answers, I am not subscribed here.
>>
>>Cheers,
>>Mik
>>
>=20
>=20


--=20
Mickael Marchand,
Ingenieur de recherche CNRS
Service Informatique, Institut Fourier - UFR Maths
Tel : 0476635655 Fax : 0476514478


--------------ms050505010503000306090401
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIL+TCC
A20wggJVoAMCAQICAQIwDQYJKoZIhvcNAQEEBQAwKzELMAkGA1UEBhMCRlIxDTALBgNVBAoT
BENOUlMxDTALBgNVBAMTBENOUlMwHhcNMDEwNDI3MDU0NjQ5WhcNMTEwNDI1MDU0NjQ5WjA0
MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEWMBQGA1UEAxMNQ05SUy1TdGFuZGFyZDCC
ASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANzhHiE9BovqvV60iNsPk5e0bQc9hmIA
Lcr/tUqO51akj2Es8aAqq/Yq3Xwsv+91VQusCU7nTmHA5wzwkBVFEgLCjOvDEmTiYxAYLssH
MdmB5dwpgpsxVuKBHopvp+ipWBFEVoNds054cC3ftv1ygUXV8e5Nzu++1T0MkCBFmgmArw9M
2iAOgL86s+sngMC5D8ChTkDcOv1qKr9A1SxxgPn4umvk6ioAqy++mvCndm2YKZwPL/BC8hiX
W8n2zBlfusK+EtJcsJCUwLfLBgTvjzDtMi16SveTu6AJpLTuM8vQg5u1tbOQ3o6QHlmcINVL
Hu3XTE+G+hw6KqHprAWgnb8CAwEAAaOBkjCBjzAMBgNVHRMEBTADAQH/MB0GA1UdDgQWBBRn
WaXlB3RJA+8Fz8wupBjVEMiePDBTBgNVHSMETDBKgBRW62i50lx+mLWlU8ORb2NYxPlrt6Ev
pC0wKzELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxDTALBgNVBAMTBENOUlOCAQAwCwYD
VR0PBAQDAgEGMA0GCSqGSIb3DQEBBAUAA4IBAQAGA0eDckWQwk7hIderF6kBVQbKQG1Voh1e
6+IUI1nkCeKQ9jyNNgYPS6cmI2XC6gaacru4jMuKX+95NiV+ANfzBpT7g0QpJjfH7umHzmyG
gBtxPdJir/bNYmxTD+Z6kwCMey4z4EEdqr5lmHbxlQd0s+Y/U3XVSwY2SynE9tyOE4BAEHOC
rRV7BHFQtTcz8shku6EQfjbGra9vcFKm0a7MzLqw6FkSj2INrQPdSyroiTmIUS/tYei3MIfb
J1VtZoejUQmAYXFRBb4THdlBMPx1XwqWmxj/vpCBtBPAchEI/Wqaage99IMstGA2ZAf6PWqn
sJAEdoPdM8s04heYBAuhMIIEQDCCAyigAwIBAgICFX8wDQYJKoZIhvcNAQEEBQAwNDELMAkG
A1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFjAUBgNVBAMTDUNOUlMtU3RhbmRhcmQwHhcNMDQx
MjA5MjAyODMyWhcNMDUxMjA5MjAyODMyWjB6MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05S
UzEQMA4GA1UECxMHR0RTMjc1NDEZMBcGA1UEAxMQTWlja2FlbCBNYXJjaGFuZDEvMC0GCSqG
SIb3DQEJARYgTWlja2FlbC5NYXJjaGFuZEB1amYtZ3Jlbm9ibGUuZnIwgZ8wDQYJKoZIhvcN
AQEBBQADgY0AMIGJAoGBAN9svCyGyJS+zLj36WziVjKmC73BCcI64sK5QMMaFd/4yuG/9CEr
1kNzDLAB64s3xdETQhfAjRQTgqT5UfXWudKjKF+QAyQeeHEPX1Dk1Pl7qS5aC45z+Xn3H3pS
iuVOdMkylk1X/wLK1SVC5MljlOEU6AGBCAP/yZuwCmvcmq+TAgMBAAGjggGYMIIBlDAMBgNV
HRMBAf8EAjAAMBEGCWCGSAGG+EIBAQQEAwIEsDAOBgNVHQ8BAf8EBAMCBeAweAYJYIZIAYb4
QgENBGsWaUNlcnRpZmljYXQgQ05SUy1TdGFuZGFyZC4gUG91ciB0b3V0ZSBpbmZvcm1hdGlv
biBzZSByZXBvcnRlciDgIGh0dHA6Ly9pZ2Muc2VydmljZXMuY25ycy5mci9DTlJTLVN0YW5k
YXJkLzAdBgNVHQ4EFgQU2ohbz2VSzXAIgw0NxJcpJXvcS44wUwYDVR0jBEwwSoAUZ1ml5Qd0
SQPvBc/MLqQY1RDInjyhL6QtMCsxCzAJBgNVBAYTAkZSMQ0wCwYDVQQKEwRDTlJTMQ0wCwYD
VQQDEwRDTlJTggECMCsGA1UdEQQkMCKBIE1pY2thZWwuTWFyY2hhbmRAdWpmLWdyZW5vYmxl
LmZyMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmxzLnNlcnZpY2VzLmNucnMuZnIvQ05S
Uy1TdGFuZGFyZC9nZXRkZXIuY3JsMA0GCSqGSIb3DQEBBAUAA4IBAQDceOh3Tg0ZSU2sspa5
9Ta0RjqdW/RW+bJx8CeexLtgMSxuTU87erfXFNsjFcLQCIR2DU1bM6HO75K5VzNfe8vGHpgm
2Gnw51vUDczk+Un/4cp8FgExi0P/uabWkEfuAQ0SC9Z18pjfHecfiKXD0z8GOfMMbUfsfYpv
Y8FnvB8AT3b3H39M31WdZyNO3mm63X/fblDvfksG29CIY+agUAUdFHTFdV/u93mQW4zuz8tD
HQqELxHCDIp4hWr635mn9aXpcR0o30VzHgdKBJjo6ojj3jvJAj+d2BM2pZA++FVaAs1a29Hk
woxTy/wND9FkeRNuWFq2xilf3RVSDHKeWcOaMIIEQDCCAyigAwIBAgICFX8wDQYJKoZIhvcN
AQEEBQAwNDELMAkGA1UEBhMCRlIxDTALBgNVBAoTBENOUlMxFjAUBgNVBAMTDUNOUlMtU3Rh
bmRhcmQwHhcNMDQxMjA5MjAyODMyWhcNMDUxMjA5MjAyODMyWjB6MQswCQYDVQQGEwJGUjEN
MAsGA1UEChMEQ05SUzEQMA4GA1UECxMHR0RTMjc1NDEZMBcGA1UEAxMQTWlja2FlbCBNYXJj
aGFuZDEvMC0GCSqGSIb3DQEJARYgTWlja2FlbC5NYXJjaGFuZEB1amYtZ3Jlbm9ibGUuZnIw
gZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGBAN9svCyGyJS+zLj36WziVjKmC73BCcI64sK5
QMMaFd/4yuG/9CEr1kNzDLAB64s3xdETQhfAjRQTgqT5UfXWudKjKF+QAyQeeHEPX1Dk1Pl7
qS5aC45z+Xn3H3pSiuVOdMkylk1X/wLK1SVC5MljlOEU6AGBCAP/yZuwCmvcmq+TAgMBAAGj
ggGYMIIBlDAMBgNVHRMBAf8EAjAAMBEGCWCGSAGG+EIBAQQEAwIEsDAOBgNVHQ8BAf8EBAMC
BeAweAYJYIZIAYb4QgENBGsWaUNlcnRpZmljYXQgQ05SUy1TdGFuZGFyZC4gUG91ciB0b3V0
ZSBpbmZvcm1hdGlvbiBzZSByZXBvcnRlciDgIGh0dHA6Ly9pZ2Muc2VydmljZXMuY25ycy5m
ci9DTlJTLVN0YW5kYXJkLzAdBgNVHQ4EFgQU2ohbz2VSzXAIgw0NxJcpJXvcS44wUwYDVR0j
BEwwSoAUZ1ml5Qd0SQPvBc/MLqQY1RDInjyhL6QtMCsxCzAJBgNVBAYTAkZSMQ0wCwYDVQQK
EwRDTlJTMQ0wCwYDVQQDEwRDTlJTggECMCsGA1UdEQQkMCKBIE1pY2thZWwuTWFyY2hhbmRA
dWpmLWdyZW5vYmxlLmZyMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmxzLnNlcnZpY2Vz
LmNucnMuZnIvQ05SUy1TdGFuZGFyZC9nZXRkZXIuY3JsMA0GCSqGSIb3DQEBBAUAA4IBAQDc
eOh3Tg0ZSU2sspa59Ta0RjqdW/RW+bJx8CeexLtgMSxuTU87erfXFNsjFcLQCIR2DU1bM6HO
75K5VzNfe8vGHpgm2Gnw51vUDczk+Un/4cp8FgExi0P/uabWkEfuAQ0SC9Z18pjfHecfiKXD
0z8GOfMMbUfsfYpvY8FnvB8AT3b3H39M31WdZyNO3mm63X/fblDvfksG29CIY+agUAUdFHTF
dV/u93mQW4zuz8tDHQqELxHCDIp4hWr635mn9aXpcR0o30VzHgdKBJjo6ojj3jvJAj+d2BM2
pZA++FVaAs1a29HkwoxTy/wND9FkeRNuWFq2xilf3RVSDHKeWcOaMYICLTCCAikCAQEwOjA0
MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEWMBQGA1UEAxMNQ05SUy1TdGFuZGFyZAIC
FX8wCQYFKw4DAhoFAKCCAUkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMDUwNDExMTkyNDMyWjAjBgkqhkiG9w0BCQQxFgQUc3Cg30OksmKsMJ8Hw4FU7mzv
af0wSQYJKwYBBAGCNxAEMTwwOjA0MQswCQYDVQQGEwJGUjENMAsGA1UEChMEQ05SUzEWMBQG
A1UEAxMNQ05SUy1TdGFuZGFyZAICFX8wSwYLKoZIhvcNAQkQAgsxPKA6MDQxCzAJBgNVBAYT
AkZSMQ0wCwYDVQQKEwRDTlJTMRYwFAYDVQQDEw1DTlJTLVN0YW5kYXJkAgIVfzBSBgkqhkiG
9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAH
BgUrDgMCBzANBggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASBgHhOUQEDTpUPFxAHDqaA
itXgSGOw9x3pWLXVr/58X28uM5rOk5zM8JIueFL0ganLai9CaCJQr/j/TvIxLMi+hioNuAt0
ejDmG1Oqb4cO5L3bnCRolYXDjHWLyU2YZCzZPxeaj2VqIUielzfT4J//umrSJvvvc+dDEmsi
RSJcN6GzAAAAAAAA
--------------ms050505010503000306090401--
