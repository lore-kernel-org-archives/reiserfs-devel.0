From: Oleg Drokin <green@namesys.com>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 02:10:43 +0400
Message-ID: <20020407021043.A10976@namesys.com>
References: <Pine.LNX.4.44.0204061014210.571-100000@idi.vamo.orbitel.bg>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204061014210.571-100000@idi.vamo.orbitel.bg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Apr 06, 2002 at 10:36:32AM +0300, Ivan Ivanov wrote:

> Reiserfs is very sensitive to disk damage. Several bad blocks on disk can
> make the entire file system unusable and all data to be lost:
> 'reiserfsck --fix-fixable' tells that I must use --rebuild-tree but it
> doesn't help.
Have you tried latest reiserfsprogs?
We are interested in such damaged filesystems, that cannot be repaired with
latest reiserfsprogs.

Bye,
    Oleg
