From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: State of the Reiser4 FS
Date: Tue, 14 Mar 2006 14:45:18 +0300
Message-ID: <1142336718.7415.55.camel@tribesman.namesys.com>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28248-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Avuton Olrich <avuton@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello

On Tue, 2006-03-14 at 02:41 -0800, Avuton Olrich wrote:
> Hello,
> 
> I just saw a thread on the LKML a minute ago asking about the state of
> getting the patch into vanilla linux. I read Andrew Morton's post
> about a month ago stating that it could happen soon, but was unlikely
> due to there not actually being a need for it to go into mainline (no
> major distro default, etc...). I was wondering, myself, earlier in the
> day what the state of the patch was, if anything further has been said
> about getting it into mainline. Was also wondering if there was a lot
> of work going into it right now, or are people tied up doing other
> things?
> 
> If anyone has time for an answer it'd be appreciated by everyone I'm sure,
> 

AFAIK, the most recent reason why reiser4 does not get included is that
reiser4 developers have to change reiser4 to use generic code to
implement read/write.
AFAICS, reiser4 developers do not work on that.

