From: David Masover <ninja@slaphack.com>
Subject: Re: 15M files
Date: Fri, 19 Aug 2005 17:09:29 -0500
Message-ID: <43065899.3030301@slaphack.com>
References: <5a59ce53050819144970d07ab0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5a59ce53050819144970d07ab0@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: studdugie <studdugie@gmail.com>
Cc: reiserfs-mailing-list <reiserfs-list@namesys.com>


studdugie wrote:
> Hello. I'm looking to replace a couple Berkeley DB data stores w/
> regular file system directories backed by reiserfs (3.6).

Why 3.6, and not 4?  I'll bet v4 is better at this.

> I
> would really appreciate some feedback from the experts before I go
> ripping out the Berkeley DB code.

Others can answer the questions about whether the FS can handle it.  I
would suggest that you consider a real database, though, at least until
Reiser4 gets a good way (sys_reiser4?) of handling multiple files --
otherwise, you can expect to lose a lot of speed to all the open(2) calls.

I don't know anything about the status of sys_reiser4.  If it's almost
done, you may want to wait for it, but I don't think it's almost done.

Maybe MySQL would do the trick?  You may end up having to benchmark it
yourself...
