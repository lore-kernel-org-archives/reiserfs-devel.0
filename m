From: "K. Posern" <quickhelp@gmail.com>
Subject: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2 vanilla
 kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Wed, 25 Aug 2010 21:00:47 -0400
Message-ID: <4C75BCBF.6010009@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms020304040309080701090603"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:x-enigmail-version:content-type;
        bh=kk5Qsox98xL3OLH06+VmMNE1Y5wWgnfDXnUpXVrbAEU=;
        b=TxdSMgY8AiDdDDHMbPh6ot9fKhjuXWC1fBljRZfN7oBKK7tyTWuF3aVAzpotBn88vn
         XhmFJhhHIW75OvKmcDVb97Bb+7p1LSEdaTeCgz76FbdmWEIUAuezDdm581a6viv/gK6s
         6PCw3/WxBdVocPglHDDYCcAKh7p97RZj5cVCU=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

This is a cryptographically signed message in MIME format.

--------------ms020304040309080701090603
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

First off: I am using reiser4 since YEARS now without the slightest
problem and I *LOVE* it! Except for deletes of large files on my SSD
drive it is VERY FAST and stable!

But now I think I might have found a bug:

If I compile javahelp on the reiser4 partition (mounted without any
special options), I get:

# du -h ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
120K	./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
# ls -la ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar=

-rw-r--r-- 1 portage portage      0 Aug 25 16:35
=2E/javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar

I am not sure what the 0 usually refers to, but I think it should not be
0, right?
Because if I do the same thing on a ramdisk or on an ext4 partition:

# du -h ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
128K	./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar
# ls -la ./javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib
-rw-r--r-- 1 portage portage 121831 Aug 25 16:54
=2E/javahelp2-2.0.02_svn46/javahelp_nbproject/dist/lib/jsearch.jar

How can I further investigate?
And/Or
What other informations would you need to further track down the problem?=


Thanks for any advise!

Best,

Knuth


--------------ms020304040309080701090603
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIKajCC
BTEwggMZoAMCAQICAwYm8zANBgkqhkiG9w0BAQUFADB5MRAwDgYDVQQKEwdSb290IENBMR4w
HAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmlu
ZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZzAeFw0wODEy
MTIxOTEzNDFaFw0xMDEyMTIxOTEzNDFaMDsxFTATBgNVBAMTDEtudXRoIFBvc2VybjEiMCAG
CSqGSIb3DQEJARYTcXVpY2toZWxwQGdtYWlsLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEP
ADCCAQoCggEBAM/XLQlhOxcmVwIU0kEDlqL9OiNezGZpMhzB/c1ibGEfBxC0v6GfQd+k00a0
tL4uzwNHquu3Lk49cc9AJbIUbppd9H0RY1dD9FpjjC8SmPlb9ZofRSr7lPlDfD4A8EqLw7KB
sp3yUs1kl7SYKAlX7JJgCqzo+CxxOEuO11dnv/ruezOMyGRPOBBMCPiPLyr7iOjkvWObgIoC
82f4EhfsXNPTV3z2b2s1k/0JPIr1t2klk8bta/8MdjSF6E3SjJyyXp0mq48izityMpi5J0U3
Gz2G9EIUBRILVSY/ZZQz2W8Ur2jhItSbpY1qLv6aSCFsrPsFOyc8HEHUaJ+SwF0WbD0CAwEA
AaOB/zCB/DAMBgNVHRMBAf8EAjAAMFYGCWCGSAGG+EIBDQRJFkdUbyBnZXQgeW91ciBvd24g
Y2VydGlmaWNhdGUgZm9yIEZSRUUgaGVhZCBvdmVyIHRvIGh0dHA6Ly93d3cuQ0FjZXJ0Lm9y
ZzBABgNVHSUEOTA3BggrBgEFBQcDBAYIKwYBBQUHAwIGCisGAQQBgjcKAwQGCisGAQQBgjcK
AwMGCWCGSAGG+EIEATAyBggrBgEFBQcBAQQmMCQwIgYIKwYBBQUHMAGGFmh0dHA6Ly9vY3Nw
LmNhY2VydC5vcmcwHgYDVR0RBBcwFYETcXVpY2toZWxwQGdtYWlsLmNvbTANBgkqhkiG9w0B
AQUFAAOCAgEAzBJqLQB9q+ZEfvidFXWVNyfEiRmvDbvOdsg+6Pl38RqKHchoZpdqsfyZV3Lv
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
MBwGA1UECxMVaHR0cDovL3d3dy5jYWNlcnQub3JnMSIwIAYDVQQDExlDQSBDZXJ0IFNpZ25p
bmcgQXV0aG9yaXR5MSEwHwYJKoZIhvcNAQkBFhJzdXBwb3J0QGNhY2VydC5vcmcCAwYm8zAJ
BgUrDgMCGgUAoIIB6DAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0xMDA4MjYwMTAwNDdaMCMGCSqGSIb3DQEJBDEWBBR4iaBeAKLQqaYzAWYeJPBZ0Nd5xjBf
BgkqhkiG9w0BCQ8xUjBQMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgZEGCSsGAQQBgjcQ
BDGBgzCBgDB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2Vy
dC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0B
CQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZwIDBibzMIGTBgsqhkiG9w0BCRACCzGBg6CBgDB5MRAw
DgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNV
BAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRA
Y2FjZXJ0Lm9yZwIDBibzMA0GCSqGSIb3DQEBAQUABIIBAFw1ExW3rist/n2E+T8Z7Zk6f3AH
s++MWL/PLbvWI+1omojWfNxF4QW/r8b/V5C8Xf90vOfOnWjsPQtx6iO3vho4V6O+uge8gbd9
/C23fR0eBMW9/WK2MvBwBOFwopWeLRl4KSuwBrjoh7GYMgUJtxVk0PhjPBij3L1a3DeMIEME
qXQbO1j1iFzMuVcIKHR5CeizZSIg/dJrEk9vpYqLjse09VjnTsJDPesgi+MYClTHXQeYJJ4l
/J0ybyOooV5jimLKo3N3s0qU0pLi0id3eW4dl+DfNJGnfWyYj0EK1mCQ0o93zOB7Es7uj9lV
SzA3fNmbC1R8wCp8sAwr3zpYK20AAAAAAAA=
--------------ms020304040309080701090603--
