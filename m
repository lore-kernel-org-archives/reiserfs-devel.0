From: Johan Isacsson <johan@oddjob.se>
Subject: Re: reiserfschk --rebuild-tree was aborted, said disk was full
Date: Thu, 15 Jun 2006 11:28:33 +0200
Message-ID: <44912841.3050609@oddjob.se>
References: <44910927.5030500@oddjob.se> <1150359868.6313.23.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms040307090909010300040603"
Return-path: <reiserfs-list-return-28787-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1150359868.6313.23.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

--------------ms040307090909010300040603
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Unfortunately that output was not logged and it will take a couple of 
hours to do a new check and get the output, but besides the specific 
numbers in the following output which i found (after posting my help 
request) in the mailing list archive the message i got was this:
[snip]

Pass 0:
Loading on-disk bitmap .. ok, 61048992 blocks marked used
Skipping 10074 blocks (super block, journal, bitmaps) 61038918 blocks will be read
0%....20%....40%....60%..                                                    lef      \
left 0, 13223 /secccseccccc  "r5" hash is selected
Flushing..finished
        Read blocks (but not data blocks) 61038918
                Leaves among those 141109
                        - leaves all contents of which could not be saved and deleted \
5  Objectids found 414533

Pass 1 (will try to insert 141104 leaves):
Looking for allocable blocks .. finished
0%....20%....40%....60%....80%....Not enough allocable blocks, checking \
bitmap...there are 1 allocable blocks, btw

out of disk space

Aborted

[/snip]

So i guess i should do as you replied to the person posting this and do 
a dd to a bigger partition and do the rebuild-tree there?
Here is the reply to the older post:

[snip]

you need to get a larger partition, dd hdg1 there, run 'reiserfsck --rebuild-sb' 
on the copy to enlarge the fs size and after that run 'reiserfsck --rebuild-tree' 
on it. or you can enlarge the existent hdg1.

Note: some disk space will be added to the current partition, if there was a 
reiserfs before, that fs metadata will be mixed with the current fs. to avoid 

it, zero the added disk space first (dd if=/dev/zero ...)

[/snip]

I don't get the last part, if i do this and it works well i end up with 
an OK file system on the other partition, should i completely wipe the 
old partition before i dd it back to avoid problems? dd if=/dev/zero 
of=/dev/oldpart?

Do you think there's any hope getting my data back?

Thanks for replying!

/Johan

Vladimir V. Saveliev skrev:
> Hello
>
> On Thu, 2006-06-15 at 09:15 +0200, Johan Isacsson wrote:
>   
>> reiserfschk --rebuild-tree was aborted when it nearly had finished pass 
>> 1 and now i can't mount the partition.
>> I no longer have the exact error message.
>>
>> Just before the filesystem got bad we had removed lots of data because 
>> the disk got full. Df then reported that there was lots of space left on 
>> that partition.
>> After that we had to power cycle the server because it got hung up and 
>> after the reboot df reborted 100% usage and that some files couldn't be 
>> read.
>> I den did a reiserfschk --check which said there wer fatal errors and 
>> that i needed to do a rebuild-tree, which i did.
>> And after a long while it was aborted at about 90% of pass 1.
>>
>> I have the version 3.6.19-2 of reiserfs-progs (FC 4).
>> Of course i read about taking a backup after i had done the 
>> --rebuild-tree :(
>>
>>     
> Please, let us see complete reiserfsck --rebuild-tree output.
>
>   


--------------ms040307090909010300040603
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIII+zCC
AtgwggJBoAMCAQICECuTqWd6YS7byc2fppiZGEgwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UE
BhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMT
I1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDUxNjA3MjE0N1oX
DTA3MDUxNjA3MjE0N1owQTEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEeMBwG
CSqGSIb3DQEJARYPam9oYW5Ab2Rkam9iLnNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIB
CgKCAQEA0B5wAdnQs8gadeIgd9aHrVV5G7+Hhd/5nZ00X6F5sEpUcKvqB1+CHczaJW/sIk+Y
LcO3GkQmXYYZuG7MjXf/4UHW/oIzD39kIBc54+oqhE/Qnt9hjqfLiyjtHlzYzv4gVLH3SAGK
CX/aX6yw1YHGMmU4WaNcLxtJqmgdVuyKetwN+vFzlTm91BDEIzxAzgk81vX4P/zNmqYLslEB
UZV+wNmr3vLmvlpmnLZqBuAhVwFUsZYH5Xdjue4Bnc0fVqwyccB+FxSfstVD+sx2iVzWyJNk
Cr6o83KAstq8opMGfRaOuSOBnSBf5CvBNXQGGT5rJCt9ery+/dVYvOwLLhs6ewIDAQABoyww
KjAaBgNVHREEEzARgQ9qb2hhbkBvZGRqb2Iuc2UwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0B
AQQFAAOBgQCw/9k3wrtWftYJZ/D+Jqp7SKkhocwGa2yUsO33GsW9jPZc+P2Xk+qZ4dluQFYZ
bSGnmcyHkc054Q9ODG/mW3FmX5E8NAcdQKP5yDVGeJI7KTCK4KfmJqbZgdCOCYT0srCW5rgC
hVsvqRS+sdGYD7oDSoQpVTjEwKXAUdCz/ot90jCCAtgwggJBoAMCAQICECuTqWd6YS7byc2f
ppiZGEgwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkExJTAjBgNVBAoTHFRoYXd0ZSBD
b25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFp
bCBJc3N1aW5nIENBMB4XDTA2MDUxNjA3MjE0N1oXDTA3MDUxNjA3MjE0N1owQTEfMB0GA1UE
AxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEeMBwGCSqGSIb3DQEJARYPam9oYW5Ab2Rkam9i
LnNlMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA0B5wAdnQs8gadeIgd9aHrVV5
G7+Hhd/5nZ00X6F5sEpUcKvqB1+CHczaJW/sIk+YLcO3GkQmXYYZuG7MjXf/4UHW/oIzD39k
IBc54+oqhE/Qnt9hjqfLiyjtHlzYzv4gVLH3SAGKCX/aX6yw1YHGMmU4WaNcLxtJqmgdVuyK
etwN+vFzlTm91BDEIzxAzgk81vX4P/zNmqYLslEBUZV+wNmr3vLmvlpmnLZqBuAhVwFUsZYH
5Xdjue4Bnc0fVqwyccB+FxSfstVD+sx2iVzWyJNkCr6o83KAstq8opMGfRaOuSOBnSBf5CvB
NXQGGT5rJCt9ery+/dVYvOwLLhs6ewIDAQABoywwKjAaBgNVHREEEzARgQ9qb2hhbkBvZGRq
b2Iuc2UwDAYDVR0TAQH/BAIwADANBgkqhkiG9w0BAQQFAAOBgQCw/9k3wrtWftYJZ/D+Jqp7
SKkhocwGa2yUsO33GsW9jPZc+P2Xk+qZ4dluQFYZbSGnmcyHkc054Q9ODG/mW3FmX5E8NAcd
QKP5yDVGeJI7KTCK4KfmJqbZgdCOCYT0srCW5rgChVsvqRS+sdGYD7oDSoQpVTjEwKXAUdCz
/ot90jCCAz8wggKooAMCAQICAQ0wDQYJKoZIhvcNAQEFBQAwgdExCzAJBgNVBAYTAlpBMRUw
EwYDVQQIEwxXZXN0ZXJuIENhcGUxEjAQBgNVBAcTCUNhcGUgVG93bjEaMBgGA1UEChMRVGhh
d3RlIENvbnN1bHRpbmcxKDAmBgNVBAsTH0NlcnRpZmljYXRpb24gU2VydmljZXMgRGl2aXNp
b24xJDAiBgNVBAMTG1RoYXd0ZSBQZXJzb25hbCBGcmVlbWFpbCBDQTErMCkGCSqGSIb3DQEJ
ARYccGVyc29uYWwtZnJlZW1haWxAdGhhd3RlLmNvbTAeFw0wMzA3MTcwMDAwMDBaFw0xMzA3
MTYyMzU5NTlaMGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAo
UHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBD
QTCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAxKY8VXNV+065yplaHmjAdQRwnd/p/6Me
7L3N9VvyGna9fww6YfK/Uc4B1OVQCjDXAmNaLIkVcI7dyfArhVqqP3FWy688Cwfn8R+RNiQq
E88r1fOCdz0Dviv+uxg+B79AgAJk16emu59l0cUqVIUPSAR/p7bRPGEEQB5kGXJgt/sCAwEA
AaOBlDCBkTASBgNVHRMBAf8ECDAGAQH/AgEAMEMGA1UdHwQ8MDowOKA2oDSGMmh0dHA6Ly9j
cmwudGhhd3RlLmNvbS9UaGF3dGVQZXJzb25hbEZyZWVtYWlsQ0EuY3JsMAsGA1UdDwQEAwIB
BjApBgNVHREEIjAgpB4wHDEaMBgGA1UEAxMRUHJpdmF0ZUxhYmVsMi0xMzgwDQYJKoZIhvcN
AQEFBQADgYEASIzRUIPqCy7MDaNmrGcPf6+svsIXoUOWlJ1/TCG4+DYfqi2fNi/A9BxQIJNw
PP2t4WFiw9k6GX6EsZkbAMUaC4J0niVQlGLH2ydxVyWN3amcOY6MIE9lX5Xa9/eH1sYITq72
6jTlEBpbNU1341YheILcIRk13iSx0x1G/11fZU8xggNkMIIDYAIBATB2MGIxCzAJBgNVBAYT
AlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNU
aGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQK5OpZ3phLtvJzZ+mmJkYSDAJ
BgUrDgMCGgUAoIIBwzAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0wNjA2MTUwOTI4MzNaMCMGCSqGSIb3DQEJBDEWBBR1tQf6uLsVY/JFBGbXTAATpzFoTjBS
BgkqhkiG9w0BCQ8xRTBDMAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDANBggqhkiG9w0D
AgIBQDAHBgUrDgMCBzANBggqhkiG9w0DAgIBKDCBhQYJKwYBBAGCNxAEMXgwdjBiMQswCQYD
VQQGEwJaQTElMCMGA1UEChMcVGhhd3RlIENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UE
AxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVtYWlsIElzc3VpbmcgQ0ECECuTqWd6YS7byc2fppiZ
GEgwgYcGCyqGSIb3DQEJEAILMXigdjBiMQswCQYDVQQGEwJaQTElMCMGA1UEChMcVGhhd3Rl
IENvbnN1bHRpbmcgKFB0eSkgTHRkLjEsMCoGA1UEAxMjVGhhd3RlIFBlcnNvbmFsIEZyZWVt
YWlsIElzc3VpbmcgQ0ECECuTqWd6YS7byc2fppiZGEgwDQYJKoZIhvcNAQEBBQAEggEAL6sP
V0Xs0tONp0zB5LckpbPR/gRK0oOiu9uK9mV200BgOcZqO+j3d/X9JYoAqdgLypxsDNLZHK6B
riHpV7kEtcPYdq7lqOQvP0J9cztJchu93eGn2Pc4xHmZP7v875+Yf19CKlrzGbHJcQh23ech
SP7n6pEzAZtftNHLnRLHaKbFc7I0GSU7gdyERgDHlxx8IzY16+pVXeB04lXwOGX+486hXjGj
MYYC07XJPzfICOYrOyreSviGFZxduI14kb+uCzyEfMRpF96U0FsAg9DroTRFHpuIObz1XYs4
piIX3vFAIc+e3Y1os/Gtt5/tWvCO1XXlsBKpV4ODFrPn8qD2dwAAAAAAAA==
--------------ms040307090909010300040603--
