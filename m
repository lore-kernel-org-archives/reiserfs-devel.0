From: Oleg Drokin <green@namesys.com>
Subject: Re: Reserved Blocks
Date: Thu, 26 Sep 2002 10:19:42 +0400
Message-ID: <20020926101942.A5436@namesys.com>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <15749.46844.233761.653142@laputa.namesys.com> <20020916125116.B8E96297C@hofmann.snowcra.sh> <15749.56464.253411.12957@laputa.namesys.com> <20020916174109.A21027@namesys.com> <m31y7ij62k.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11544-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <m31y7ij62k.fsf@multivac.cwru.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello!

On Wed, Sep 25, 2002 at 02:07:41PM -0400, Paul Jarc wrote:
> > Also consider there is set uid application that outputs data.
> > I just do setuid_app >>/fs_to_fill/somefile
> > and repeat it that much times to fill the fs.
> That won't work.  The open() for the ">>" output redirection is done

It should.

> by the shell, not the setuid program.  But if the setuid program lets

That's right. But the program that writes into that file is setuid program.
And blocks are allocated by that setuid program.
This is only works if you can create files of fs you want to fiil of course.
At least that's my current belief ;)

Bye,
    Oleg
