From: Oleg Drokin <green@namesys.com>
Subject: Re: disk damage test
Date: Sun, 7 Apr 2002 14:11:49 +0400
Message-ID: <20020407141149.A13669@namesys.com>
References: <20020407130504.A13396@namesys.com> <Pine.LNX.4.44.0204071216050.24623-100000@dns.vamo.orbitel.bg>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0204071216050.24623-100000@dns.vamo.orbitel.bg>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Cc: reiserfs-list@namesys.com

Hello!

On Sun, Apr 07, 2002 at 12:17:36PM +0300, Ivan Ivanov wrote:
> > Ok, and reiserfsck - failed to repair the FS? Did it segfaulted or did
> > it just finished the work, but FS was still damaged, or something else?
> It finished work ok, but the filesystem is damaged.

How can you tell?
Did sybsequent run of reiserfsck --check finds any errors or did kernel
prints error messages, or any other criteria?

Thank you.

Bye,
    Oleg
