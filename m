From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Mon, 7 Feb 2005 21:50:36 +0100
Message-ID: <20050207215036.39ca391c@polo.concept-micro.com>
References: <20050206034102.3956432d@polo.concept-micro.com>
	<1107771769.9024.119.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1107771769.9024.119.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le lun 07 f=E9v 2005 13:22:51 CET, Vladimir Saveliev <vs@namesys.com> a =E9=
crit
:

> Hello

	Hi,

> yes, reiserfs reuses inode number of removed files for newly created
> files. However, ext2 also does that. Have  you ever noticed this problem
> on other filesystems?

No, but I'm only using rsync -H for a few weeks. The problem may also exist
with tar, but unnoticed (unless tar detects hardlinks in a different way,
or does more checks, like checking the consistency with references counters,
whatever, to avoid it). rsync handles hardlinks in a final pass, so as soon
as the verbosity level is raised, problems are easy to detect.

I have only one server left that uses ext2. It's also saved with rsync, no
problem seen so far (a few weeks only, as I said).
But the filesystem used isn't the only difference. Usage pattern probably
matters a lot. On the system where it happens, hardlinked files are often
Maildir files (unsurprizingly) and mrtg log files (which are rotated every 5
minutes). inodes are probably freed by mrtg, and one reused for a new email.

> You can try to make reiserfs to not free inode numbers of removed files
> with the attached patch and check whether it helps. It decreases number
> of files which can be created on a filesystem to ~2^^32.
> I am not sure if it is enough for low traffic IMPA server.

Ok, I can probably try this hack to verify the hypothesis. But what are the
drawbacks, on the long term ? Lost disk space ? What happens if all inode
numbers get allocated ? mkreiserfs ?

Best regards,
Pierre.
