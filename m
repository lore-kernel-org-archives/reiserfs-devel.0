From: Hans Reiser <reiser@namesys.com>
Subject: Re: Bug in reiserfsck 3.6.5
Date: Wed, 09 Apr 2003 21:17:07 +0400
Message-ID: <3E945593.2090508@namesys.com>
References: <200304090557.29034.kelledin+RFS@skarpsey.dyndns.org> <20030409141506.A2757@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13624-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030409141506.A2757@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Kelledin <kelledin@users.sourceforge.net>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Wed, Apr 09, 2003 at 05:57:29AM -0500, Kelledin wrote:
>  
>
>>I recently found that when installing reiserfsprogs with
>>/sbin/fsck.reiserfs symlinked to reiserfsck, fsck.reiserfs
>>generates a SIGABORT when called as an fsck backend via "fsck -a
>>-A -C -T" (fairly common command used in some system boot
>>scripts).  It was quite interesting to troubleshoot, as the
>>problem _didn't_ occur if I turned fsck.reiserfs into a wrapper
>>script, or called "fsck.reiserfs -a /dev/sda14" directly from
>>the bash prompt...
>>    
>>
>[...]
>
>Thanks for the analysis. Actually we already performed it some time ago.
>Grab the patch for reiserfsprogs-3.6.5 from 
>ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.5-flush_buffers-bug.patch
>
>Or you can grab the reiserfsprogs 3.6.6-pre1 which is also contains the bugfix.
>
>Bye,
>    Oleg
>
>
>  
>
please feel encouraged to do more debugging for us though..... :)  best,

-- 
Hans


