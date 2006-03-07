From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: Poor performance (was Re: strange reiser4 messages in /var/log/messages)
Date: Tue, 07 Mar 2006 12:14:04 -0500
Message-ID: <440DBF5C.3010808@parkheights.dyndns.org>
References: <440CC07D.3050802@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <440CC07D.3050802@parkheights.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

This is the result of testing SMTP server on the same machine with the
/var/spool partition formatted once as reiser4, and once as ext3.
The server was accepting messages from smtp-source generating messages
of with 20k byte length in 40 parallel sessions on another host, and
sending it to another machine running smtp-sink for /dev/nulling all
these traffic. The only difference was the filesystem, once reiser4 and
once ext3.
The difference was very clear, while on ext3 sendmail manage to deliver
103.74 msg/sec, on reiser4 it gives only 36.25 messages/sec. 1 message
delivery involves reading and deleting 2 files in /var/spool. On ext3 it
receives 159.49 msg/sec, while on reiser4 - only 40.31 msg/sec.
Receiving a message involves creating 2 files, one for the message and
one small file for smtp information about it.
I hope this poor reiser4 performance is due to this conditions,
reflected in /var/log/messages, and will be fixed.
-- 
 With best regards,
       Sergey Ivanov.

Sergey Ivanov wrote:
> Hi,
> I have vanilla 2.6.15.4 kernel with reiser4-for-2.6.15-1.patch applied.
> The machine is SMP with SCSI 17G drive formatted as reiser4.
> The reiser4 works for /var/spool, with rate about 100 files/sec creating
> and deleting sometimes after, average filesize about 10k, with total
> spool size about 5G.
> Under load the following messages from reiser4 occur in the log:
> --
> Mar  5 13:21:02 test-10 kernel: <4>reiser4[sendmail(3485)]:
> disable_write_barrier (fs/reiser4/wander.c:233)[zam-1055]:
> Mar  5 13:21:02 test-10 kernel: WARNING: disabling write barrier
> --
> and then recurring lines:
> --
> [skip]
> Mar  6 17:47:52 test-10 kernel: <4>reiser4[sendmail(17150)]:
> commit_current_atom (fs/reiser4/txnmgr.c:1092)[nikita-3176]:
> Mar  6 17:47:52 test-10 kernel: WARNING: Flushing like mad: 16384
> ...
> Please, advice, what do these messages mean, does this situation result
> in data loss or damage, and are there some new patches to fix it?
>   

