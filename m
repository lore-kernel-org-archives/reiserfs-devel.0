From: Chris Mason <mason@suse.com>
Subject: Re: External journals and NVRAM devices
Date: 04 Nov 2002 08:16:31 -0500
Message-ID: <1036415792.14291.12.camel@tiny>
References: <20021101213703.D142A50D503@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11910-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021101213703.D142A50D503@server5.fastmail.fm>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: JP Howard <jh_lists@fastmail.fm>
Cc: Edward Shishkin <edward@namesys.com>, Andreas Dilger <adilger@clusterfs.com>, ReiserFS List <reiserfs-list@namesys.com>, Oleg Drokin <green@namesys.com>

On Fri, 2002-11-01 at 16:37, JP Howard wrote:
 
> Apologies to all for my lack of reading comprehension. Yes, of course
> that shows 32M...
> 
> When the 2.4.20 journal-size patches are out I'll try and do some
> benchmarking with larger journals on NVRAM devices. We use Cyrus IMAPd
> which is very fsync intensive, so I expect an NVRAM journal may make a
> big difference...
> 

The data logging patches include a ton of reiserfs writeback changes
that allow good performance with small transactions (like mail server
workloads) and small log sizes.

With ext3, a 128M or bigger log can really improve performance because
so much of the writeback is done through bdflush/kupdate.  With a bigger
log, it is much more likely things will already be written to the main
disk by the time you need to wrap around and reuse part of the log for a
new transaction.  So a big log, and tuning bdflush to trigger writeback
quickly can really help ext3 performance.

(note, this gives ext3 some memory pressure advantages)

With data logging reiserfs a mail server will rarely need more than a
32MB log.  A larger log can help when you've got a very full tree
(millions of files), since those transactions will be slightly larger,
or when you are doing fsyncs on big files.

Andrew Morton's synctest program is a pretty good tool for benchmarking
optimal transaction parameters.

-chris


