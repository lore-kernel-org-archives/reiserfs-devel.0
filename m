From: Nishant Sharma <nishantt@cse.iitd.ernet.in>
Subject: Re: ReConfigurable Directory Structure & Agrregation of files according
 to semantic.
Date: Wed, 17 Mar 2004 23:19:52 +0530
Message-ID: <40588FC0.9000504@cse.iitd.ernet.in>
References: <20040317075333.96561.qmail@web60404.mail.yahoo.com> <40580A55.7030809@cse.iitd.ernet.in> <87y8pzjtgw.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms030009050005070103030801"
Return-path: <reiserfs-list-return-17280-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87y8pzjtgw.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

--------------ms030009050005070103030801
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hubert Chan wrote:

>>>>>>"Nishant" == Nishant Sharma <nishantt@cse.iitd.ernet.in> writes:
>>>>>>            
>>>>>>
>
>Nishant>     I wonder if it is possible to put this "plugin
>Nishant> infrastructure" in the user space rather than kernel space, by
>Nishant> putting it in the glibc implementation. ...
>
>I've thought about this too, but I think it would be harder to put this
>in glibc.  Something like gnome-vfs is able to use plugins easily,
>because it uses a URL-like syntax, and so it can tell what plugin to use
>based on the format of the filename.  But for the type of stuff we
>would want to do, glibc would have to make a bunch of kernel calls to
>determine up to when, in the filename, the kernel can handle, and when
>it has to start doing its processing.  So if you requested the file:
>/home/hubert/music/foo.mp3/..albumcover/cover.jpg, I imagine the
>sequence of events would have to be something like:
>- glibc asks the kernel for /home/.../cover.jpg
>- kernel returns "file not found"
>- glibc asks the kernel for /home/.../..albumcover
>- kernel returns "file not found"
>- glibc asks the kernel for /home/.../foo.mp3
>- kernel returns file handle
>- glibc does its processing to extract the album cover.
>
    This particular problem can be solved by having a system call, 
which, when queried about
"/home/hubert/music/foo.mp3/..albumcover/cover.jpg", always gives the 
maximal path-match found, in
particular, "/home/hubert/music/foo.mp3/".

>
>  
>


--------------ms030009050005070103030801
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJHTCC
AukwggJSoAMCAQICAwvIoTANBgkqhkiG9w0BAQQFADBiMQswCQYDVQQGEwJaQTElMCMGA1UE
ChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNv
bmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwHhcNMDQwMjI0MDcxMzIwWhcNMDUwMjIzMDcxMzIw
WjBQMR8wHQYDVQQDExZUaGF3dGUgRnJlZW1haWwgTWVtYmVyMS0wKwYJKoZIhvcNAQkBFh5u
aXNoYW50dEBrcml0aWthbHNvbHV0aW9ucy5jb20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAw
ggEKAoIBAQC8aKk7xbEOcIMD4dJxVrxIrA04/l/zDRqcihiMZn6irC6Vnl3HwWbs7HvGFGn9
aRshNygdM1NuLq95uR1ALlvp4Jl4mV/RzJY5AQqBzOVU8m48b/Hi+k7R+R8Pinch3mpa8oT3
txVFncpGqyZNkb6troh8YMIWIU0QePLbzuDixk64pbJuxvwMoVJbOOJx73lmwBJrrUebBpzG
RCDAm2VCXv8wTHAIkxcHOlKWnO+8W8BPW+m7/g14CeHaw5KqPPbbgOuObWsaD78IfuZvmf+0
gjN8DXOebVxQOPv6tcPlTeY4ceO6MSE9cVAY/W9PHij839ofEtjNzlXAl9KQoRunAgMBAAGj
OzA5MCkGA1UdEQQiMCCBHm5pc2hhbnR0QGtyaXRpa2Fsc29sdXRpb25zLmNvbTAMBgNVHRMB
Af8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAK01F4ygkpth2Dlb+x6RPb9J4bhG5Wyc3rkPauSG
hYCUt/A+G1llrMTcikFqXVmGpk03V450T1wgyBvvJmIbY3l4S/SS/h1V4LkjFE+DQiUTqd0k
Wu1qKK/KuMdNYTpT4te0fawSrWwrqCuk3G8mfI1RUacPAQFiQRbJT2b3kFL+MIIC6TCCAlKg
AwIBAgIDC8ihMA0GCSqGSIb3DQEBBAUAMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJl
ZW1haWwgSXNzdWluZyBDQTAeFw0wNDAyMjQwNzEzMjBaFw0wNTAyMjMwNzEzMjBaMFAxHzAd
BgNVBAMTFlRoYXd0ZSBGcmVlbWFpbCBNZW1iZXIxLTArBgkqhkiG9w0BCQEWHm5pc2hhbnR0
QGtyaXRpa2Fsc29sdXRpb25zLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEB
ALxoqTvFsQ5wgwPh0nFWvEisDTj+X/MNGpyKGIxmfqKsLpWeXcfBZuzse8YUaf1pGyE3KB0z
U24ur3m5HUAuW+ngmXiZX9HMljkBCoHM5VTybjxv8eL6TtH5Hw+KdyHealryhPe3FUWdykar
Jk2Rvq2uiHxgwhYhTRB48tvO4OLGTrilsm7G/AyhUls44nHveWbAEmutR5sGnMZEIMCbZUJe
/zBMcAiTFwc6Upac77xbwE9b6bv+DXgJ4drDkqo89tuA645taxoPvwh+5m+Z/7SCM3wNc55t
XFA4+/q1w+VN5jhx47oxIT1xUBj9b08eKPzf2h8S2M3OVcCX0pChG6cCAwEAAaM7MDkwKQYD
VR0RBCIwIIEebmlzaGFudHRAa3JpdGlrYWxzb2x1dGlvbnMuY29tMAwGA1UdEwEB/wQCMAAw
DQYJKoZIhvcNAQEEBQADgYEArTUXjKCSm2HYOVv7HpE9v0nhuEblbJzeuQ9q5IaFgJS38D4b
WWWsxNyKQWpdWYamTTdXjnRPXCDIG+8mYhtjeXhL9JL+HVXguSMUT4NCJROp3SRa7Woor8q4
x01hOlPi17R9rBKtbCuoK6TcbyZ8jVFRpw8BAWJBFslPZveQUv4wggM/MIICqKADAgECAgEN
MA0GCSqGSIb3DQEBBQUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBl
MRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgwJgYD
VQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3dGUg
UGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVtYWls
QHRoYXd0ZS5jb20wHhcNMDMwNzE3MDAwMDAwWhcNMTMwNzE2MjM1OTU5WjBiMQswCQYDVQQG
EwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMj
VGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0EwgZ8wDQYJKoZIhvcNAQEBBQAD
gY0AMIGJAoGBAMSmPFVzVftOucqZWh5owHUEcJ3f6f+jHuy9zfVb8hp2vX8MOmHyv1HOAdTl
UAow1wJjWiyJFXCO3cnwK4Vaqj9xVsuvPAsH5/EfkTYkKhPPK9Xzgnc9A74r/rsYPge/QIAC
ZNenprufZdHFKlSFD0gEf6e20TxhBEAeZBlyYLf7AgMBAAGjgZQwgZEwEgYDVR0TAQH/BAgw
BgEB/wIBADBDBgNVHR8EPDA6MDigNqA0hjJodHRwOi8vY3JsLnRoYXd0ZS5jb20vVGhhd3Rl
UGVyc29uYWxGcmVlbWFpbENBLmNybDALBgNVHQ8EBAMCAQYwKQYDVR0RBCIwIKQeMBwxGjAY
BgNVBAMTEVByaXZhdGVMYWJlbDItMTM4MA0GCSqGSIb3DQEBBQUAA4GBAEiM0VCD6gsuzA2j
ZqxnD3+vrL7CF6FDlpSdf0whuPg2H6otnzYvwPQcUCCTcDz9reFhYsPZOhl+hLGZGwDFGguC
dJ4lUJRix9sncVcljd2pnDmOjCBPZV+V2vf3h9bGCE6u9uo05RAaWzVNd+NWIXiC3CEZNd4k
sdMdRv9dX2VPMYIDOzCCAzcCAQEwaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3Rl
IENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0ECAwvIoTAJBgUrDgMCGgUAoIIBpzAYBgkqhkiG9w0BCQMxCwYJKoZI
hvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wNDAzMTcxNzQ5NTJaMCMGCSqGSIb3DQEJBDEWBBQD
T+0R/7z/29pr7klGJ05xAhw2IDBSBgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqG
SIb3DQMCAgIAgDANBggqhkiG9w0DAgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDB4Bgkr
BgEEAYI3EAQxazBpMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGlu
ZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWlu
ZyBDQQIDC8ihMHoGCyqGSIb3DQEJEAILMWugaTBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMc
VGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFs
IEZyZWVtYWlsIElzc3VpbmcgQ0ECAwvIoTANBgkqhkiG9w0BAQEFAASCAQCYPprlr+6yDvVr
/BhCD9RdSPQ0R3YjoWYhybYxzr5xXSSJBXrLcyZsIBrRZOElXj/lQWL+WvkJLlG7VpaKNJHS
4GlkvC37Q8QJ6DRI4/yngOmYo6LbH42mwvMybcsZJa23N7Dbb5JeJrSZpigIg7fvvlbCJNaG
opbdDsNDMAniAc+jIWXzZqgJKvLAduqvqA4xxOxAJ0kYUpun5S5l9xBAyyTM9u0fCmLd3Cqx
oOhXhF8JFkFpzdYCyiJh6vinCXCG77Zx0H21XMJQZrPjxiKOu3R8D4rmLerk0e3iES0727wG
eW+3JMW1+etg7FITMsU8bFTUK7xftS4FVUzFnuZJAAAAAAAA
--------------ms030009050005070103030801--

