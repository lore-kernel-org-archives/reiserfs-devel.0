From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Where is reiserfsprogs?
Date: Thu, 11 Oct 2012 11:53:28 -0400
Message-ID: <5076EB78.8090904@suse.com>
References: <alpine.DEB.2.01.1209241627360.10880@trent.utfs.org> <50610261.20307@suse.com> <alpine.DEB.2.01.1209242016500.10880@trent.utfs.org> <506125F1.4030500@suse.com> <50619895.7000003@gmail.com> <5075900B.9060402@suse.com> <507595AA.50201@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <507595AA.50201@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Christian Kujau <lists@nerdbynature.de>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10/10/12 11:35 AM, Edward Shishkin wrote:
> On 10/10/2012 05:11 PM, Jeff Mahoney wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> On 9/25/12 7:42 AM, Edward Shishkin wrote:
>>> On 09/25/2012 05:33 AM, Jeff Mahoney wrote:
>>>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>>>> 
>>>> On 9/24/12 11:19 PM, Christian Kujau wrote:
>>>>> On Mon, 24 Sep 2012 at 21:01, Jeff Mahoney wrote:
>>>>>> I don't know if there's an official site anymore. You
>>>>>> can grab 3.6.21 from the "filesystems" project in the
>>>>>> open build service[1]
>>>>> Thanks!
>>>>> 
>>>>> @Edward, do you want to add this to your Sorceforge
>>>>> account? Or can you put this back on your kernel.org home?
>>>>> Or do we want to have the openSUSE build service to be the
>>>>> new "official" place for reiserfsprogs?
>>>> While I wouldn't mind seeing the publicity for OBS, that's
>>>> not really the goal of the project.
>>>> 
>>>> Edward, it's up to you. I know you don't do much with
>>>> reiser3 anymore. I can apply for and host it at a kernel.org
>>>> account if you'd prefer. I have an outstanding patch anyway.
>>> 
>>> OK, try to apply.
>>> 
>>> I am sorry, currently this is a problem for me to collect
>>> needed amount of signatures to recreate my account at
>>> kernel.org.
>> Ok. I've published the versions of reiserfsprogs that SUSE has
>> shipped in products (so I know that they're valid). Our
>> ftp.namesys.com archive has long since been empty, so that's
>> really the best I can do.
>> 
>> That means the following versions: 3.x.0j 3.6.2 3.6.4 3.6.9 
>> 3.6.13 3.6.18 3.6.19 3.6.20 3.6.21
>> 
>> http://ftp.kernel.org/pub/linux/kernel/people/jeffm/reiserfsprogs
>>
>>
>> 
Incidentally, the SUSE version of 3.6.21 has for some time carried
>> patches for signedness and a use-after-free. If nobody has any 
>> objections, I'll publish that as 3.6.22.
> 
> OK. I've also found some old stuff (4 patches), that you might find
> interesting (will resend).

Great, thanks.

- -Jeff


- -- 
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.18 (Darwin)
Comment: GPGTools - http://gpgtools.org
Comment: Using GnuPG with Mozilla - http://www.enigmail.net/

iQIcBAEBAgAGBQJQdut4AAoJEB57S2MheeWyYYMP/06mzEE6DQQSPR7pBpfCE/wJ
l7w4Q4+y5AywV2dsqawCbuJJTyDo4Z95Js6ouPzU4TiBJuWV7u5wqDnXlHELvFC3
SqWZECRC/iVwbYHDcFJqcJVt3DaxLUMf/gOoAcx9S//Yr0Ze/pEwxA1qr+FqAsqe
wNayoswuLz6QX7EosVBkKDnxelv1368cq0ulm2ZIJoHZZJTp6OyoBx+edCiifvvG
DN+nI8i/j7EZ+b1F89cKhWAeHsYDAaX9lAYjedGJ4YRoSVw5dRN59WP2Hg+ORYIf
lEknbijsPl6UIkv0HN3oYhne2kuyrmhqUeLU6hnBDFpVzMnIBiSq4TrbOmTewsbK
5WXzZR0YDd5zeUxJ8D4JHEWhILWrrVttcLk78IA5DDhd7rItzWhNdoR5wR0O5Ndh
pMJN2HOiKYoQBhurDPLoRDIlsTY3aolHBG7l8p5pHjg+KPO4t8/fK09aqqgLsjb3
5nuEUdHJYhk7D4+ZWvheHDpby88lxjal8NB8brc5qnFB7XLTcJhJzylRx2xyWUup
amYuT5A49mA6DRCzKKz5w3IJSqay7a6pilzJ1VG+aO5u0UOaTyZ5x97m+KaHsdEg
Zee/3m3geE9/n6nLbTIChev52cmnpbae6Wph8CGrKNB5fz5+ZO6U8d/Xazm5zuJ4
pyWqeypuwaqcHNp6RBaf
=ciVw
-----END PGP SIGNATURE-----
