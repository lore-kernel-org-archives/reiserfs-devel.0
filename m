From: Anders Widman <andewid@tnonline.net>
Subject: Re: System freeze with data=ordered,journal
Date: Thu, 16 Jan 2003 16:33:38 +0100
Message-ID: <49107717578.20030116163338@tnonline.net>
References: <187106764671.20030116161746@tnonline.net>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <187106764671.20030116161746@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Anders Widman <andewid@tnonline.net>
Cc: Reiserfs-List@namesys.com

Update:

freeze   still  happens  without  data=journal.... Problem is probably
somewhere else then..


>    Using 2.4.21-3 with data logging patches from
>    ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.21

>    Root  FS  is  ReiserFS. When mounting with data=ordered,journal the
>    system  freesez  after  a  few  minutes.  I get no kernel errors or
>    nothing  in  the  logs,  and  nothing on the screen. Keyboard stops
>    working - only hard reset works.

>    When  not using these mount options (same kernel with patches) then
>    the systems runs just fine.

>    //Anders

