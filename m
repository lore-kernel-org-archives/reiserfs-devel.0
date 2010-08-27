From: "K. Posern" <quickhelp@gmail.com>
Subject: Re: strange problem with reiser4 with ccreg40 on amd64 2.6.35.2 vanilla
 kernel + tuxonice + reiser4 on a mdadm imsm raid-0 partition
Date: Thu, 26 Aug 2010 22:58:31 -0400
Message-ID: <4C7729D7.3050004@gmail.com>
References: <4C75BCBF.6010009@gmail.com>	<op.vh1ct9tghogzsi@g17b>	<4C76633D.9010106@gmail.com>	<op.vh17zoyrhogzsi@g17b>	<4C76FCB4.9010404@gmail.com> <AANLkTi=EjdZO26VKB7HBdS=Qup1DAorPmJOZEohmhCwq@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha1; boundary="------------ms000309000106000904020902"
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type;
        bh=tlNDzAsCZV3wrP81gIEVY7E3sb6791Q4NL7o3Z73kzg=;
        b=F771GpItw2keoSAhYmtC7TK5VucRCPGgNUSsEY0CK9sYvbcbvrqJFMDYU5bNJX3Kpa
         jSKe/LRkkKP4xfR3rezRKRWn4NeEpq/JNg/4jNVbjHgnzk4iLsPEUjQ1mVAs/kkwPjx4
         ARPmZxftKrVjiBg0XVvmapX8T7dHAV0cIp4o0=
In-Reply-To: <AANLkTi=EjdZO26VKB7HBdS=Qup1DAorPmJOZEohmhCwq@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: Jordan Patterson <jordanp@gmail.com>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

This is a cryptographically signed message in MIME format.

--------------ms000309000106000904020902
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Thanks for the report non-the-less :)

P.S.: ... I just hope you don't use btrfs (did you read the assessment=20
of Edward Shishkin)?

On 26/08/10 19:58, Jordan Patterson wrote:
> Hi:
>
> I have a 64-bit Gentoo install, and I would get the same kernel bug
> when trying to emerge some java applications, such as ant-base.  This
> happened with the 2.6.35 and 2.6.34 kernels.
>
> I was using ccreg40 with lzo compression.
>
> My CFLAGS are "-march=3Dcore2 -O2 -pipe", which shouldn't have been a
> problem.  I'm not using reiser4 any more, so I can only confirm this
> bug.
>
> Jordan
>
> On Thu, Aug 26, 2010 at 5:45 PM, K. Posern<quickhelp@gmail.com>  wrote:=

>> Hi,
>>
>> On 26/08/10 15:20, Jon=C3=A1=C5=A1 Vidra wrote:
>>>
>>> Could you, please, recompile both the kernel and reiser4progs
>>> (and possibly their dependencies :D) with -O2 instead of -O3
>>> in CFLAGS? It tends to break things in strange and nasty ways,
>>> why do you have it enabled globally like this? Are you sure
>>> it's actually needed?
>>
>> I had read around and found comments that it can actually make things =
faster
>> and so I decided to give it a try.
>> You said "break things in strange and nasty ways":
>> Does this mean it can compile well and then just not WORK right (like =
for
>> example: mkfs.reiser4 doing the wrong things when formatting)??
>> I only heard that it can break the compilation, no? And for me everyth=
ing
>> compiled fine.
>>
>> The difference between -O2 and -O3 are these 6 options:
>>>    -fgcse-after-reload                         [enabled]
>>>    -finline-functions                          [enabled]
>>>    -fipa-cp-clone                              [enabled]
>>>    -fpredictive-commoning                      [enabled]
>>>    -ftree-vectorize                            [enabled]
>>>    -funswitch-loops                            [enabled]
>>
>> Can you maybe comment on them?
>>
>> ... Because I could also use O2 and turn on some of them...
>> I was told: -ftree-vectorize and -funswitch-loops should be good and m=
aybe
>> -fpredictive-commoning?!
>>
>>> Also, CCache is not used anymore, remove it from FEATURES.
>>> If you actually _use_ CCache (i.e. you've installed it
>>> manually), unmerge it immediately. It's broken by design.
>>>
>>> Other stuff in your FEATURES looks fishy as well, but it
>>> shouldn't affect builds. I hope you know what you're doing.
>>
>> Thanks! I used your comment to review my features again :)
>> ... and I disabled CCACHE.
>>
>> If you don't mind: Now I am interested in your feedback about the othe=
r
>> features:
>>
>> These should be 100% secure, right:
>>         buildsyspkg -- secure I guess ;) ... and I like it in case som=
ething
>> f's up big-scale in portage and I start emerging ;) ... happened once =
to a
>> friend of mine ... just try to use portage when python is broken ;)
>>         collision-protect -- useful I find
>>         parallel-fetch -- faster downloads who doen't want that
>>         metadata-transfer -- necessary for sqlite with portage (afaik)=

>>         noauto -- convenient
>>         noinfo -- I just don't use "info"
>>
>> SECURITY - Drop-Priviledges
>> -->  should if things compile also be fine, right?
>>         userpriv usersandbox userfetch usersync
>>
>> SECURITY - MISC:
>> -->  These I like for some additional (security) checking:
>> (I guess about them and the File-Permissions I am the most interested =
in
>> your opinion)
>>         sandbox - seems also useful to me, no?
>>         strict - seems like a good thing from the description
>>
>> SECURITY - File-Permissions
>> <<<  they might be scetchy, right?... but should not do /harm/
>>         sfperms
>>         suidctl
>>
>> Thanks a lot!
>>
>> Knuth
>>
>>



--------------ms000309000106000904020902
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
Fw0xMDA4MjcwMjU4MzFaMCMGCSqGSIb3DQEJBDEWBBSZcfQGXazj9AAvy/jU2iIMwNdnHzBf
BgkqhkiG9w0BCQ8xUjBQMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgIC
AIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwgZEGCSsGAQQBgjcQ
BDGBgzCBgDB5MRAwDgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2Vy
dC5vcmcxIjAgBgNVBAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0B
CQEWEnN1cHBvcnRAY2FjZXJ0Lm9yZwIDBibzMIGTBgsqhkiG9w0BCRACCzGBg6CBgDB5MRAw
DgYDVQQKEwdSb290IENBMR4wHAYDVQQLExVodHRwOi8vd3d3LmNhY2VydC5vcmcxIjAgBgNV
BAMTGUNBIENlcnQgU2lnbmluZyBBdXRob3JpdHkxITAfBgkqhkiG9w0BCQEWEnN1cHBvcnRA
Y2FjZXJ0Lm9yZwIDBibzMA0GCSqGSIb3DQEBAQUABIIBAMEX5+PblDBo/4NlDU8bfgRGzUym
vh3+jyF7C18vZKJB77B0fnA/Qphh0N7ScD/Vi/aUGxsAv8ejBvZQ8cXJiZh3Kt4hQO/oQYYx
ypdzm2pgfIN0GyytFsfPrflXTllMBtkwNXeyqOCvH+7n9zOcdCYSTpSe0MgmcyOK2OxZICQc
0STVFQ3weFhf55L+O7Ndi3bv1WVpSbhJhG2hTuaPLM5f8Bv8/97m0dENx+6+phzkUjhYy0ZD
WncOaLJbG0Omhio5K17BjIudgewG5u6EDydjFhydGtL4t17R/OiwF5Vs5IBOQ7FbYxDdeyFD
j688O4xzMtNAxEvwWYmExmfBZ20AAAAAAAA=
--------------ms000309000106000904020902--
