From: Oleg Drokin <green@namesys.com>
Subject: Re: journal-2018 trouble?
Date: Tue, 25 Mar 2003 09:32:30 +0300
Message-ID: <20030325093230.A32093@namesys.com>
References: <200303242255.48998.gustavo@zacarias.com.ar>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13368-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200303242255.48998.gustavo@zacarias.com.ar>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: reiserfs-list@namesys.com, grev@namesys.com

Hello!

On Mon, Mar 24, 2003 at 10:55:48PM -0300, Gustavo Zacarias wrote:

> I'm getting loads of journal-2018 kernel messages when mounting a reiser 
> filesystem from a lvm block device.
> ---snip---
> Mar 24 22:22:30 anubis kernel: reiserfs: checking transaction log (device 
> 3a:00) ...
> Mar 24 22:22:30 anubis kernel: journal-2018: Bad transaction length 7 
> encountered, ignoring transaction
> ---

Argh, you have formatted your filesystem with some old fsck version that does not put
correct journal information into superblock.
So it thinks journal size is zero and rejects to replay any transactions.
Hm, I wonder how that problem escaped our tests.

> ---reiserfsck 3.6.5 snip---
> reiserfs_open_journal: journal parameters from super block does not match to
> journal parameters from journal.
> Either make journal partition available or use --no-journal-available
> If you have the standard journal or if your partition is available
> and you specified it correctly, you must run rebuild-sb.
> ---
> 05-more-mount-checks

Please either do not apply this patch or follow the rebuild-sb advance (it will ask you
if you want to update journal paremreters and you should agree).

I will come up with the fix shortly.
Also this have nothing to do with LVM

Bye,
    Oleg
