From: "Jesper Juhl" <jesper.juhl@gmail.com>
Subject: Re: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not directory or indirect item
Date: Sun, 30 Jul 2006 19:39:07 +0200
Message-ID: <9a8748490607301039k1057da87i237ee42e83f8ef4b@mail.gmail.com>
References: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
	 <p737j1v3sum.fsf@verdi.suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29274-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <p737j1v3sum.fsf@verdi.suse.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <ak@suse.de>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On 30 Jul 2006 19:28:17 +0200, Andi Kleen <ak@suse.de> wrote:
> "Jesper Juhl" <jesper.juhl@gmail.com> writes:
>
> > I just got a warning message with 2.6.18-rc3 that I've never seen before :
> >
> >   ReiserFS: sda4: warning: vs-8115: get_num_ver: not directory or indirect item
>
> I already often saw them with 2.6.16 on multiple machines.  Never
> tracked down what the problem was though.
>
they don't seem to have caused any trouble/corruption here, so if you
haven't experienced any problems either I think I'll relax and just
wait for an explanation from some reiserfs folks.

Thank you for replying - nice to know that I'm not the only one seeing
this and that it's not something that has caused massive troubles for
someone else.


-- 
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
