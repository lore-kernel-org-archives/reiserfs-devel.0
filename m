From: marco <marco@accessplus.com.au>
Subject: Re: online fsck
Date: Wed, 25 May 2005 09:26:15 +1000
Message-ID: <4293B817.5030906@accessplus.com.au>
References: <263a8b350505231124758be936@mail.gmail.com> <42930542.1000407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42930542.1000407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "E.Gryaznova" <grev@namesys.com>
Cc: btinsley <btinsley@gmail.com>, reiserfs-list@namesys.com



E.Gryaznova wrote:

> Hello.
> reiserfsck can check reiserfs filesystem mounted read-only.

Running 'fsck.reiserfs --check -y </dev/part>' will do the trick.  The 
equivalent for ext3 and other filesystems is
'fsck -n </dev/part>', the ext3 version detects that it is mounted rw, 
and does a readonly check.

What I wonder is if we can get fsck.reiser[fs,4] to honour option 
processing in a manner more consistant with
the other fscks, so that adding reiserfs to a list of user choosable 
filesystems is not going to cause a nightmare
of an overhead of filesystem detection, command option re-mapping and 
other related headaches.....

>
> Thanks,
> Lena
>
> btinsley wrote:
>
>> Is there or was there a plan to support running reiserfsck on a
>> mounted v3 filesystem (just a check, not a fix or rebuild)? I seem to
>> remember this being mentioned here at some point in time, but I was
>> unable to find it in the mailing list archive.
>>
>> Thanks!
>>
>>
>>  
>>
>
>
>
>
>

-- 
 Marco Grigull  www.accessplus.com.au  AccessPlus Internet Solutions
Ph +61 7 5451 1146  Fax +61 7 5451 1945 Email marco@accessplus.com.au

