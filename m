From: Hans Reiser <reiser@namesys.com>
Subject: Re: Conversion from v3.6 to v4 of Reiserfs...
Date: Wed, 25 Feb 2004 12:37:30 +0300
Message-ID: <403C6CDA.3050204@namesys.com>
References: <20040224172153.M90659@pk25.com> <Pine.LNX.4.58.0402242120330.13298@renaissance.laroia.net> <403C5DC5.4010701@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <403C5DC5.4010701@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: "Diaz Rodriguez, Eduardo" <ediaz@pk25.com>, reiserfs-list@namesys.com

Christian Mayrhuber wrote:

> Asheesh Laroia wrote:
>
>> There is the program convertfs:
>>     http://tzukanov.narod.ru/convertfs/
>>
>> I don't think it suports reiser4, but you could probably write a 
>> patch or
>> ask the author nicely.  It's supposed to do in-place filesystem 
>> conversion
>> by using a sparse loopback file.
>>
>> I've only heard good things about it, but I've never used it.
>>
>> -- Asheesh.
>>
>
> convertfs is in debian testing/unstable, just to let you know.
> You should have a look at:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=230995
>
> I don't think it can handle reiser4, yet.
> Reiser4 is not stable now, so if you care for your data I'd
> stick with reiserfs v3.6 for now.
>
I fear that unless someone funds convertfs, it will not become mature.  
Reiser4 however is very close to release.

-- 
Hans


