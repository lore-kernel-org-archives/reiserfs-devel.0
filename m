From: Oleg Drokin <green@namesys.com>
Subject: Re: using reiserfs as a DB
Date: Tue, 23 Apr 2002 10:44:28 +0400
Message-ID: <20020423104428.A2930@namesys.com>
References: <3CC45294.2060806@priocom.com> <Pine.LNX.4.30.0204221954040.26977-100000@vortex.ukshells.co.uk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10139-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.30.0204221954040.26977-100000@vortex.ukshells.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Richard Emslie <rxe@ukshells.co.uk>
Cc: Yura Umanets <umanets@priocom.com>, Phil Howard <phil-reiserfs@ipal.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Hello!

On Mon, Apr 22, 2002 at 08:26:19PM +0100, Richard Emslie wrote:

> > The instance of what is a raw access to files and directories you can
> > see on http://reiserfs.linux.kiev.ua/progsreiserfs-0.3.0.tar.gz in
> > files: object.c, file.c, dir.c
> Sorry for sounding dumb but am I right in saying this code does not go
> near reiserfs kernel code.  ie it is directly accessing at block level?

Yes.

> Is this reiserfs-raw?  If so how does this benfit from the reiserfs's
> internal tree?

No. Reiserfs-raw is a different thing. In reiserfs-raw you actually mount your
fs, and then access the data through ioctls.

> If this has nothing to do with reiserfs-raw, how can one access a
> partition when mounted raw?  ie open(pathname) doesn't make much sense.

You can do it through ioctl. Nikita should know the details.

Bye,
    Oleg
