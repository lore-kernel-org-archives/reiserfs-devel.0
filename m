From: Oleg Drokin <green@namesys.com>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 16:11:51 +0400
Message-ID: <20020407161151.A14163@namesys.com>
References: <20020407141149.A13669@namesys.com> <Pine.LNX.4.44.0204071407220.25447-100000@dns.vamo.orbitel.bg>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204071407220.25447-100000@dns.vamo.orbitel.bg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 07, 2002 at 02:21:10PM +0300, Ivan Ivanov wrote:

> So,  reiserfsck --check tels that I must run  reiserfsck --rebuild-tree.
> I am running  reiserfsck --rebuild-tree two times and it tels everything
> is OK.  reiserfsck --check tels OK too. But mount tels that directory not
> found. What directory !! may be /. mount -t reiserfs tels the same.

Hm. Have you saved a file from that particular experiment?
Anything was left in logs?

Bye,
    Oleg
