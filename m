From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: [PATCH] MAINTAINERS: reiserfs entry is out of date
Date: Fri, 23 May 2008 00:08:28 -0400
Message-ID: <4836433C.9050105@suse.com>
References: <20080522222321.721.16051.stgit@core> <20080522162542.9eb9fd01.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080522162542.9eb9fd01.akpm@linux-foundation.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Andrew Morton wrote:
> On Thu, 22 May 2008 23:23:22 +0100
> Alan Cox <alan@lxorguk.ukuu.org.uk> wrote:
> 
>> From: Alan Cox <alan@redhat.com>
>>
>>
>>
>> Signed-off-by: Alan Cox <alan@redhat.com>
> 
> (swtiched lists)
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index deda30e..163cd8c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3401,10 +3401,7 @@ L:	rtc-linux@googlegroups.com
>>  S:	Maintained
>>  
>>  REISERFS FILE SYSTEM
>> -P:	Hans Reiser
> 
> well yes.
> 
>> -M:	reiserfs-dev@namesys.com
> 
> OK.
> 
>>  L:	reiserfs-devel@vger.kernel.org
> 
> OK
> 
>> -W:	http://www.namesys.com
> 
> OK
> 
>>  S:	Supported
> 
> That's debatable.
> 
> It would be nice to have a go-to guy for reiser3.  Usually that's Jeff,
> sometimes Jan, occasionally Chris, occasionally Edward.
> 
> Are people happy with Alan's proposal, or might it inspire a sudden
> spirit of volunteerism or something?

You're right. Usually it is me and I do watch the reiserfs-devel list
for reiser3 bugs. I also have a patch queue that I've been sitting on
for way too long that I'm just putting the finishing touches on. I think
I'd rather see S: Maintained instead, though.

- -Jeff

- --
Jeff Mahoney
SUSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iEYEARECAAYFAkg2QzwACgkQLPWxlyuTD7JUwQCfSKi0rPOqmavixOoCBdrl8vSF
a2YAnicbu94fH4zORdu1kZK0tUCqOUfR
=N1fy
-----END PGP SIGNATURE-----
