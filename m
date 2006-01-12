From: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 15:08:35 -0500
Message-ID: <200601121508.36380.fred@lab.matcom.uh.cu>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <f18a8d980601121033x12e0b148g65ecc78f306b4446@mail.gmail.com> <200601121502.32227.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27683-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601121502.32227.fred@lab.matcom.uh.cu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>, reiserfs-List@namesys.com

On Thursday 12 January 2006 03:02 pm, you wrote:

 Please remember the plugin it's in an earlier design phase, and the answers

> can change, but right now this is what I think:
> > I think versioning plugin is a great idea and I bet there're many people
> > like me waiting for such a plugin. However, I have few questions;
> >
> > what happens when I delete a file? should I loose all history of the file
> > with such action?
>
 I think the history should  go away too, since history will be stored as
deltas.
>
> > if there's an undelete plugin, what kind of hooks needed so undelete
> > recovers the full state of the file with history.
>
 Undelete plugin is for future work. right now I'm thinking  that if there
 is mechanism to track down the versioning info of a file no matter the
 directory it's located,  then this should not be a problem.

> > another concern is backup; if I backup the file or the entire directory
> > (or drive), is it transparent to the backup app, or something extra
> > needed to be done to backup the history of the file?
>
 don't know right now. will come with more answers on next days.
>
> > if you store all the history in  a sub direcotry let's say .rev and make
> > it generic (and hence visible) to everyone, the above problems will go
> > away.
> >
> > for example filename.ext deltas could be stored in  .rev/filename-
> > rev-date-time.delta with base rev in .rev/filename-rev-date-time.ext
>
 But what happens if i type:
 $ mv filename.ext ../
 then the entire file revision tree must be copied. that's why i mention the
 idea of mechanism to track down the versioning info of a file.
>
> > correct me if I'm missing something, because I don't know the plugin
> > mechanism of reiser4.
Thanks a lot for the questions.
