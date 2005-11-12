From: Hans Reiser <reiser@namesys.com>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Fri, 11 Nov 2005 22:38:56 -0800
Message-ID: <43758E00.4000601@namesys.com>
References: <200511111359.39715.jgilmore@glycou.com>	 <1131746768.9841.6.camel@localhost> <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26877-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, John Gilmore <jgilmore@glycou.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Being seamless, cleanly implemented, and requiring little or no admin
work, matters a lot to end users.

Yes, users can do what you said with rsync, but it is important that it
be no more work than specifying a --use-versioning mount option, and
even that is beyond most users (but that is where defaults come in to
help them).

The namespace for the past versions should be as cleanly done as WAFL
does them.  Whether space gets freed automatically when space gets <10%
is another mount option.  Where we might do better than WAFL is in
allowing touching filename/..../checkin to cause a version to get
recorded, rather than doing it at particular times.

Hans
