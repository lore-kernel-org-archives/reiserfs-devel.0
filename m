From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [PATCH] small typo
Date: Thu, 25 Mar 2004 13:33:53 +0300
Message-ID: <16482.46481.818339.639402@laputa.namesys.com>
References: <200403242022.17761.filipe@rnl.ist.utl.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403242022.17761.filipe@rnl.ist.utl.pt>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Filipe Almeida <filipe@rnl.ist.utl.pt>
Cc: reiserfs-list@namesys.com

Filipe Almeida writes:
 > Here's the fix for a small typo in entd.c...
 > 
 > Regards,
 > Filipe Almeida
 > --- reiser4/entd.c.old	2004-03-24 20:19:09.161973952 +0000
 > +++ reiser4/entd.c	2004-03-24 20:19:15.790966192 +0000
 > @@ -117,7 +117,7 @@
 >  		entd_set_comm("!");
 >  		if (result == 0)
 >  			entd_flush(super);
 > -		else if (result != EINTR)
 > +		else if (result != -EINTR)

Thank you. Applied.

 >  			/* some other error */
 >  			warning("nikita-3099", "Error: %i", result);
 >  	}

Nikita.
