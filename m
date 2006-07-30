From: Andi Kleen <ak@suse.de>
Subject: Re: 2.6.18-rc3 - ReiserFS - warning: vs-8115: get_num_ver: not directory or indirect item
Date: 30 Jul 2006 19:28:17 +0200
Message-ID: <p737j1v3sum.fsf@verdi.suse.de>
References: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-29273-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: ak@suse.de
In-Reply-To: <9a8748490607300608v65ce3bdcsbb47273bb82a2d6c@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Juhl <jesper.juhl@gmail.com>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

"Jesper Juhl" <jesper.juhl@gmail.com> writes:

> I just got a warning message with 2.6.18-rc3 that I've never seen before :
> 
>   ReiserFS: sda4: warning: vs-8115: get_num_ver: not directory or indirect item

I already often saw them with 2.6.16 on multiple machines.  Never
tracked down what the problem was though.

-Andi
