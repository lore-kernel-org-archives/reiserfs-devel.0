From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 01 Sep 2005 16:53:32 +0400
Message-ID: <4316F9CC.2090904@namesys.com>
References: <20050901134604.31ddd297@SiRiUS.home> <20050901144842.34629bcf@SiRiUS.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25778-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050901144842.34629bcf@SiRiUS.home>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Kuther <gimpel@sonnenkinder.org>
Cc: reiserfs-list@namesys.com

Hello

Thomas Kuther wrote:
> On Thu, 1 Sep 2005 13:46:04 +0200
> Thomas Kuther <gimpel@sonnenkinder.org> wrote:
> 
>>Hello People!
>>
>>Just got a new harddrive and as i'm pretty pleased with reiser4 i
>>thought i'll make it reiser4. But then i realized that it uses almost
>>1/6 of the hd "for nothing"
>>
>>mkfs.reiser4 /dev/hde1:
>>/dev/hde1  reiser4    222G  7,5M  222G   1% /shared
>>
>>mkfs.reiserfs
>>/dev/hde1 reiserfs    233G   33M  233G   1% /shared
>>
>>somehow i had in mind that reiser4 should use much less space than
>>reiserfs, but it's exactly the other way round. Loosing 17GB of an
>>250GB disk is hard anyway. but loosing 28GB is simply no go.
>>
>>Now do i need to pass any special options to mkfs.reiser4 or why is
>>that? i'm using reiser4progs 1.0.4
>>
>>Thanks in advance
>>Tom
> 
> OK found out one thing:
> Disk /dev/hde: 250.0 GB, 250059350016 bytes <-- crap! 
> 
> # echo "250059350016/1024/1024/1024" | bc
> 232
> ^^
> but that still doesn't explain why df only sees 222 when formatted with
> reiser4.

reiser4 reserves 5% of disk space for its internal needs.
