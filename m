From: Alexander Gruber <alex@gruber.cn>
Subject: Re: disk runs full
Date: Fri, 13 May 2005 00:23:04 +0200
Message-ID: <4283D747.1070606@gruber.cn>
References: <42834307.2090101@gruber.cn> <200505121510.j4CFAJdk012045@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms030604070702050301060601"
Return-path: <reiserfs-list-return-24051-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200505121510.j4CFAJdk012045@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

--------------ms030604070702050301060601
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

I already thought of this too but the output doesn=B4t look like as if=20
there are over 3GB not closed yet. Before the reboot i did a few minutes=20
ago only /dev/null was opened several times. I would say about 30-40=20
instances.


Valdis.Kletnieks@vt.edu wrote:

>On Thu, 12 May 2005 13:50:31 +0200, Alexander Gruber said:
> =20
>
>>I checked it with du -sh * on the root partition and the result was much =

>>smaller than the used space reported by df.
>>   =20
>>
>
>Note that temporary files are often creat()ed and then unlink()ed, leaving
>the open file descriptor as the last reference.  You should probably run
>'lsof' or similar tool.  On my laptop at the moment:
>
>lsof -n | grep dele
>cardmgr    2207       root    3u   CHR      254,0                5556 /dev=
/cm-2123-2 (deleted)
>cardmgr    2207       root    4u   CHR      254,1                5559 /dev=
/cm-2123-5 (deleted)
>cardmgr    2207       root    5u   CHR      254,2                5562 /dev=
/cm-2123-8 (deleted)
>exmh       7142     valdis   10u   REG       0,16        0      74035 /tmp=
/tclfG25oV (deleted)
>gconfd-2   7805     valdis   13wW  REG       0,16      641      44735 /tmp=
/gconfd-valdis/lock/0t1115905590ut151063u967p7805r252866408k3219173544 (del=
eted)
>aspell     9481     valdis    2u   REG       0,16        0      74035 /tmp=
/tclfG25oV (deleted)
>
>So there's 2 open but unlinked files on /tmp, and du and df will show up d=
ifferent
>values. (Note that exmh did an open() of a file, unlinked it, and then pas=
sed
>the open file descriptor to aspell as stdin - so that space will be reclai=
med
>once *both* of those processes have done a close() on the file descriptor).
> =20
>

--------------ms030604070702050301060601
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII3TCC
AskwggIyoAMCAQICAw4FLjANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDUwMjEyMTIyNDExWhcNMDYwMjEyMTIyNDEx
WjBAMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR0wGwYJKoZIhvcNAQkBFg5h
bGV4QGdydWJlci5jbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAKafyiCo+bob
i6aivATGOSkV5Z7jnuNLEtPnIq2GS87BNsaUovazV51xk5mRoF3qbMp8/iqxcQ7OfBeqScF4
rtE12hFjdhZN0pkeukiKEiFeeqe174sfhGKN+nRLy9+NXyGkBSmH0AYVvwT+7x+C9s5iZnzx
JCNTdU6J+STlNlsTdQQ7EPzVlcE1gkeC7srw3di0qvSefsoCPpHbrboD4BgCPtUyop7b5KiU
BPwPi09bLFPHKA2cIamcjKN89WfRwfn9bpPP+Tfbp6GGRG6AH7IMufY5Uu52KSHopNlfBJqs
EFn82LcgvnRaXwNe2L19uRNEp9NXmJA9CZuCjZgqI90CAwEAAaMrMCkwGQYDVR0RBBIwEIEO
YWxleEBncnViZXIuY24wDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQCtlMl+5eBk
9VEXI8oTOXy9i/wRHqzVREx4n+iTVAnrMS/4u3qVGpoEsSLgQsQyi61FX/3L601n1f/WBwK0
SG75F8FsAz1hYKdzFX88AaJix59qwnfVcrmh7MPbQZbomtrJOMaw9mLbTbgb6qf0mJzO8qIb
LyAwh2GVKit5OdIf7jCCAskwggIyoAMCAQICAw4FLjANBgkqhkiG9w0BAQQFADBiMQswCQYD
VQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDUwMjEyMTIyNDEx
WhcNMDYwMjEyMTIyNDExWjBAMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMR0w
GwYJKoZIhvcNAQkBFg5hbGV4QGdydWJlci5jbjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCC
AQoCggEBAKafyiCo+bobi6aivATGOSkV5Z7jnuNLEtPnIq2GS87BNsaUovazV51xk5mRoF3q
bMp8/iqxcQ7OfBeqScF4rtE12hFjdhZN0pkeukiKEiFeeqe174sfhGKN+nRLy9+NXyGkBSmH
0AYVvwT+7x+C9s5iZnzxJCNTdU6J+STlNlsTdQQ7EPzVlcE1gkeC7srw3di0qvSefsoCPpHb
rboD4BgCPtUyop7b5KiUBPwPi09bLFPHKA2cIamcjKN89WfRwfn9bpPP+Tfbp6GGRG6AH7IM
ufY5Uu52KSHopNlfBJqsEFn82LcgvnRaXwNe2L19uRNEp9NXmJA9CZuCjZgqI90CAwEAAaMr
MCkwGQYDVR0RBBIwEIEOYWxleEBncnViZXIuY24wDAYDVR0TAQH/BAIwADANBgkqhkiG9w0B
AQQFAAOBgQCtlMl+5eBk9VEXI8oTOXy9i/wRHqzVREx4n+iTVAnrMS/4u3qVGpoEsSLgQsQy
i61FX/3L601n1f/WBwK0SG75F8FsAz1hYKdzFX88AaJix59qwnfVcrmh7MPbQZbomtrJOMaw
9mLbTbgb6qf0mJzO8qIbLyAwh2GVKit5OdIf7jCCAz8wggKooAMCAQICAQ0wDQYJKoZIhvcN
AQEFBQAwgdExCzAJBgNVBAYTAlpBMRUwEwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcT
CUNhcGUgVG93bjEaMBgGA1UEChMRVGhhd3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRp
ZmljYXRpb24gU2VydmljZXMgRGl2aXNpb24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBG
cmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNv
bTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3MTYyMzU5NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYD
VQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVy
c29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEA
xKY8VXNV+065yplaHmjAdQRwnd/p/6Me7L3N9VvyGna9fww6YfK/Uc4B1OVQCjDXAmNaLIkV
cI7dyfArhVqqP3FWy688Cwfn8R+RNiQqE88r1fOCdz0Dviv+uxg+B79AgAJk16emu59l0cUq
VIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEAAaOBlDCBkTASBgNVHRMBAf8ECDAGAQH/AgEAMEMG
A1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9jcmwudGhhd3RlLmNvbS9UaGF3dGVQZXJzb25hbEZy
ZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIBBjApBgNVHREEIjAgpB4wHDEaMBgGA1UEAxMRUHJp
dmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcNAQEFBQADgYEASIzRUIPqCy7MDaNmrGcPf6+svsIX
oUOWlJ1/TCG4+DYfqi2fNi/A9BxQIJNwPP2t4WFiw9k6GX6EsZkbAMUaC4J0niVQlGLH2ydx
VyWN3amcOY6MIE9lX5Xa9/eH1sYITq726jTlEBpbNU1341YheILcIRk13iSx0x1G/11fZU8x
ggM7MIIDNwIBATBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGlu
ZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWlu
ZyBDQQIDDgUuMAkGBSsOAwIaBQCgggGnMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJ
KoZIhvcNAQkFMQ8XDTA1MDUxMjIyMjMwNFowIwYJKoZIhvcNAQkEMRYEFA1mUt5+zlpcAN1W
ISDVFQgTYMYYMFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCA
MA0GCCqGSIb3DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMHgGCSsGAQQBgjcQBDFr
MGkwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0
ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAgMOBS4w
egYLKoZIhvcNAQkQAgsxa6BpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29u
c3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwg
SXNzdWluZyBDQQIDDgUuMA0GCSqGSIb3DQEBAQUABIIBAFNEqT26DtZPPW2IL7UX/TqLar1v
WhbOwqVO0nhb9WlK8zSksjrbpUgWCZqnjfLMQqxdsp8DpaagaBe/cQPWOG0BitQWbaFHPFr2
vcH79Y83aaoLrdqM5LH0mDPe4bWp/KX+gAFGEjdY23C5d1QKkKMLsIC3qBoMuIOW5cfhgI6X
WnuzPzcDH0v/7kZmegNni+uVLACZXXW4qsfCcuI3lVd3g0WrtTsHDV3DaBAe1/0yvLhNEXcq
bXqKUHVerangV2Iv+TwnR3lAjN83PDVz178/Kno3DZFfIpE7Hx9jIeJywTN0siJap9iHLDVi
7bgfmc3CA+lVGFrCDBWfPQ9d4m8AAAAAAAA=
--------------ms030604070702050301060601--
