From: Toomas Laasik <toomas@ac24.ee>
Subject: Re: Authoring a versioning plugin
Date: Fri, 13 Jan 2006 23:17:06 +0200
Message-ID: <43C818D2.4080805@ac24.ee>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <200601121014.37940.pvh@uvic.ca> <43C80EC3.7050003@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms040508090401080009000606"
Return-path: <reiserfs-list-return-27701-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C80EC3.7050003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--------------ms040508090401080009000606
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,
Here are some links that I have found while searching such file systems 
that can keep versions or log of changes:
http://logfs.sourceforge.net/ - small logging filesystem project started 
by a student, but not very stable yet
http://wayback.sourceforge.net/ - written in Perl, based on quite old 
version on FUSE API
http://sourceforge.net/projects/cvsfs - uses CVS as file system, based 
on FUSE API
http://www.opensolaris.org/os/community/zfs/ - very powerful file system 
that supports snapshots of files
Microsoft has made something too on their server platform, but I 
couldn't find a link for that.

It seems to me that many have started with it, but haven't finished. 
Creating a versioning FS that is comercially stable and fast takes a lot 
of effort and is quite complex. Go discover what and how others have 
done it and how to do it best in ReiserFS.

I would be very interested in stable file system that supports automatic 
versioning. Maybe ReiserFS becomes the first one that I can actually 
use. I don't want a userspace FS, but a good FS where I can safely keep 
my FreeBSD installation.

Toomas

--------------ms040508090401080009000606
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIH7zCC
AlIwggG7oAMCAQICEDsDMZSjMMFeR/eJFekNJvIwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA1MTIwNjIyMzk1OVoX
DTA2MTIwNjIyMzk1OVowQDEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEdMBsG
CSqGSIb3DQEJARYOdG9vbWFzQGFjMjQuZWUwgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGB
AKuM+OiRKjhpvDPruoaEGoCHdqy4ziMm0DI17a8r/KCeI3Cbv5zgJ9zR5ZG107yLWALsU0lB
i9IgaRv2Nc9yPhHtYsHIOSJ7J47Bo6XcABg1SH9u7pliCISoFqD8/O7rF1VmZACoWlEh74U+
JgSpCoXTGu/+ZmkQMpCkdZ3h3FEfAgMBAAGjKzApMBkGA1UdEQQSMBCBDnRvb21hc0BhYzI0
LmVlMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEEBQADgYEAOwPQ05m4RkRSfNUz1jxQpCg2
X4oh9syWvx51i1m8f6TQLAKV9y5Dg/VfmICsgzNEIgFlfcwoRPm0JZlEd4LAdW4J3phrPHYP
XiDFVo5XWW2kPQClnNx+ueqNr3nPXFTiNRQfVupJ3P2hK9/n2pCs8VJDXBH3+M6cFJ4aeXY7
Rz8wggJSMIIBu6ADAgECAhA7AzGUozDBXkf3iRXpDSbyMA0GCSqGSIb3DQEBBAUAMGIxCzAJ
BgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQTAeFw0wNTEyMDYyMjM5
NTlaFw0wNjEyMDYyMjM5NTlaMEAxHzAdBgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBNZW1iZXIx
HTAbBgkqhkiG9w0BCQEWDnRvb21hc0BhYzI0LmVlMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCB
iQKBgQCrjPjokSo4abwz67qGhBqAh3asuM4jJtAyNe2vK/ygniNwm7+c4Cfc0eWRtdO8i1gC
7FNJQYvSIGkb9jXPcj4R7WLByDkieyeOwaOl3AAYNUh/bu6ZYgiEqBag/Pzu6xdVZmQAqFpR
Ie+FPiYEqQqF0xrv/mZpEDKQpHWd4dxRHwIDAQABoyswKTAZBgNVHREEEjAQgQ50b29tYXNA
YWMyNC5lZTAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBADsD0NOZuEZEUnzVM9Y8
UKQoNl+KIfbMlr8edYtZvH+k0CwClfcuQ4P1X5iArIMzRCIBZX3MKET5tCWZRHeCwHVuCd6Y
azx2D14gxVaOV1ltpD0ApZzcfrnqja95z1xU4jUUH1bqSdz9oSvf59qQrPFSQ1wR9/jOnBSe
Gnl2O0c/MIIDPzCCAqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkEx
FTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFU
aGF3dGUgQ29uc3VsdGluZzEoMCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZp
c2lvbjEkMCIGA1UEAxMbVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcN
AQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEz
MDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5n
IChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5n
IENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDEpjxVc1X7TrnKmVoeaMB1BHCd3+n/
ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J8CuFWqo/cVbLrzwLB+fxH5E2
JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+nttE8YQRAHmQZcmC3+wID
AQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4oDagNIYyaHR0cDov
L2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmwwCwYDVR0PBAQD
AgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODANBgkqhkiG
9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0HFAg
k3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCAuMwggLfAgEBMHYwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhA7AzGUozDBXkf3iRXpDSby
MAkGBSsOAwIaBQCgggHDMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkF
MQ8XDTA2MDExMzIxMTcwNlowIwYJKoZIhvcNAQkEMRYEFEv8l7m61LY64OH5E9Pikwsr+JUE
MFIGCSqGSIb3DQEJDzFFMEMwCgYIKoZIhvcNAwcwDgYIKoZIhvcNAwICAgCAMA0GCCqGSIb3
DQMCAgFAMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMIGFBgkrBgEEAYI3EAQxeDB2MGIxCzAJ
BgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYD
VQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQOwMxlKMwwV5H94kV
6Q0m8jCBhwYLKoZIhvcNAQkQAgsxeKB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQQIQOwMxlKMwwV5H94kV6Q0m8jANBgkqhkiG9w0BAQEFAASBgIv6
LF3R+/eiFtFmUvathcGVAB7rvyP4QzfUiBWtwMjLYK6NjIZ+3WgYZ5mtkrmaM6N749v+J+uw
KCEUPYaUIxeUjDeirn5JCDuG4FZawoMoznaFBIAffey0zQD669HfD/lgA4uf8eVorlhVyjJr
V5n9NU5eWWJ1QbLY2dQAQpN9AAAAAAAA
--------------ms040508090401080009000606--
