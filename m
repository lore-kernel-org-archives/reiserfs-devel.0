From: Joachim Reichelt <Reichelt@gbf.de>
Subject: Re: Lost ACL
Date: Fri, 20 Feb 2004 09:07:54 +0100
Message-ID: <4035C05A.3090100@gbf.de>
References: <402CE469.4010809@gbf.de>	<402D1B26.3040009@suse.com> <16429.7163.319615.173151@laputa.namesys.com> <402D37F5.9040008@suse.com> <4034EAAE.2050908@gbf.de> <4034EEB2.6090208@suse.com> <4034F371.8000001@suse.com> <4035BF5A.9070001@gbf.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4035BF5A.9070001@gbf.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Nikita Danilov <Nikita@namesys.com>, reiserfs-list@namesys.com



Joachim Reichelt schrieb am 02/20/2004 09:03 AM:

>
>
> Jeff Mahoney schrieb am 02/19/2004 06:33 PM:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Jeff Mahoney wrote:
>> | Joachim Reichelt wrote:
>> | |> i just got 2.4.25 up.
>> | |> But there is no ACL anywhere in the kernel.
>> | |> Do I have to patch something
>> | |> I found ACL in ext3, xfs....
>> | |> So there are NO ACLs in the code?????????
>> |
>> | ACLs and Extended Attributes are an external patch. The SuSE kernels
>> | have them by default, which is why you were able to use them with your
>> | SuSE install. Periodically, I sync up the ACL code with the mainline
>> | kernels.
>> |
>> | Expect an updated version for 2.4.25 later today on my ftp site:
>> | ftp://ftp.suse.com/pub/people/jeffm/reiserfs/aclea/
>>
>> To follow up; The 2.4.23 patches apply cleanly to 2.4.24 and 2.4.25.
>>
> Yes, thats true, but :
> make config
> make dep
> make bzImage
> gives
> ...
> In file included from namei.c:9:
> /usr/src/linux-2.4.25/include/linux/reiserfs_acl.h:2: 
> linux/posix_acl.h: Datei oder Verzeichnis nicht gefunden
> /usr/src/linux-2.4.25/include/linux/reiserfs_acl.h:3: 
> linux/xattr_acl.h: Datei oder Verzeichnis nicht gefunden
> namei.c:1320: warning: initialization from incompatible pointer type
> namei.c:1335: warning: initialization from incompatible pointer type
> ...
> AND
> sbjre:/usr/src/linux # find .. -name posix_acl.h -o -name xattr_acl.h
> ../linux-2.4.18.SuSE/include/linux/posix_acl.h
>
> btw:
> I have a 2.4.23 source tree there too.
>
O.K.
I forgot to read README!
These patches apply after Andreas Gruenbacher's ACL/EA patches from
http://acl.bestbits.at

>> - -Jeff
>>
>> - --
>> Jeff Mahoney
>> SuSE Labs
>> jeffm@suse.com
>> -----BEGIN PGP SIGNATURE-----
>> Version: GnuPG v1.2.2 (GNU/Linux)
>> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>>
>> iD8DBQFANPNxLPWxlyuTD7IRAt5XAKCVksCWf0+xWwJazaIlqLT5UiXfRQCeJrbx
>> 5HZlQuQiM/AwfeJQ0Xqjl1k=
>> =ww5l
>> -----END PGP SIGNATURE-----
>
>
>

-- 
Mit freundlichen Gruessen                         Best Regards
 
         Joachim Reichelt

WWW: http://www.gbf.de         _/_/_/   _/_/_/   _/_/_/_/
WWW: http://www.gbf.de/sb    _/    _/  _/   _/  _/
                            _/        _/   _/  _/
Mascheroder Weg 1          _/  _/    _/_/_/   _/_/_/
D-38124 Braunschweig      _/    _/  _/   _/  _/
Tel: +(49) 531 6181 352  _/    _/  _/   _/  _/
FAX: +(49) 531 2612 388   _/_/_/  _/_/_/   _/

			SB  - Strukturbiologie
              GBF - Gesellschaft fuer Biotechnologische Forschung
                    German Research Centre for Biotechnology

See me at:
EMAIL: REICHELT@gbf.de    WWW:  http://www.gbf.de/sb/Reichelt.htm

-- Disclaimer --
Standard > Keyword : Opinions, my own, nobody else's, whatsoever ...

Man muss sich notfalls jemand mieten,
hat man an Geist selbst nichts zu bieten!     (Heinz Erhardt)

