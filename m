From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Mon, 07 Feb 2005 11:26:07 -0800
Message-ID: <4207C0CF.6060806@namesys.com>
References: <20050206034102.3956432d@polo.concept-micro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050206034102.3956432d@polo.concept-micro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

Pierre Etchemaite wrote:

>	Hi all,
>
>I'm using rsync to make a full backup of one box to another. Both are using
>reiserfs 3.6.
>The problem is that at the end of the backup, some pairs of unrelated files
>(usually 3 or 4), are hardlinked together.
>
>>From what I've read in rsync mailing list archives, it probably means that
>inode numbers are being reused while the backup is in progress.
>
>Does that look plausible to you ?
>
>And if it is, what can be done to significantly lower the probability of
>inode number reuse over a short time ? The backup shouldn't take over 1
>hour, the server stores around 570k files, but it's only a quite low traffic
>IMAP server, so even with 32 bits inode numbers there's probably some room
>for improvement.
>
>I know a definitive answer would be to backup filesystem snapshots, but the
>source server isn't currently using LVM1, and as far as I know snapshots
>haven't been reimplemented yet for LVM2 :(
>
>Best regards,
>Pierre.
>
>
>  
>
This really sounds like an rsync bug, maybe you could cc the rsync 
mailing list or tridgell?
