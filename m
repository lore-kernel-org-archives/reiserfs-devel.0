From: prj@po.cwru.edu (Paul Jarc)
Subject: Re: Reserved Blocks
Date: Wed, 25 Sep 2002 14:07:41 -0400
Message-ID: <m31y7ij62k.fsf@multivac.cwru.edu>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
	<15749.46844.233761.653142@laputa.namesys.com>
	<20020916125116.B8E96297C@hofmann.snowcra.sh>
	<15749.56464.253411.12957@laputa.namesys.com>
	<20020916174109.A21027@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11540-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020916174109.A21027@namesys.com> (Oleg Drokin's message of
 "Mon, 16 Sep 2002 17:41:09 +0400")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Oleg Drokin <green@namesys.com> wrote:
> Also consider there is set uid application that outputs data.
> I just do setuid_app >>/fs_to_fill/somefile
> and repeat it that much times to fill the fs.

That won't work.  The open() for the ">>" output redirection is done
by the shell, not the setuid program.  But if the setuid program lets
the user specify a filename to write to, then it could be vulnerable,
and it would still be vulnerable even if the program check permissions
with access().


paul
