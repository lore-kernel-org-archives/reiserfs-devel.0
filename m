From: Olivier Galibert <galibert@pobox.com>
Subject: Re: -mm -> 2.6.13 merge status
Date: Thu, 23 Jun 2005 18:23:25 +0200
Message-ID: <20050623162325.GA21971@dspnet.fr.eu.org>
References: <20050620235458.5b437274.akpm@osdl.org.suse.lists.linux.kernel> <p73d5qgc67h.fsf@verdi.suse.de> <42B86027.3090001@namesys.com> <20050621195642.GD14251@wotan.suse.de> <42B8C0FF.2010800@namesys.com> <84144f0205062223226d560e41@mail.gmail.com> <42BA67C9.7060604@namesys.com> <1119543302.4115.141.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1119543302.4115.141.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Pekka Enberg <penberg@gmail.com>, Alexander Zarochentcev <zam@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Jun 23, 2005 at 08:15:03PM +0400, Vladimir Saveliev wrote:
> Pekka, would you prefer something like:
> 
> reiser4_fill_super()
> {
>     if (init_a() == 0) {
> 	if (init_b() == 0) {
> 	    if (init_c() == 0) {
> 		if (init_last() == 0)
> 		    return 0;
> 		else {
> 		    done_c();
> 		    done_b();
> 		    done_a();
> 		}
> 	    } else {
> 		done_b();
> 		done_a();
> 	    }
> 	} else {
> 	    done_a();
> 	}
>     }
> }

No, I think he means the traditional:

reiser4_fill_super()
{
   if (init_a())
     goto failed_a;
   if (init_b())
     goto failed_b;
   if (init_c())
     goto failed_c;
   if (init_last())
     goto failed_last;
   return 0;

 failed_last:
   done_c();
 failed_c:
   done_b();
 failed_b:
   done_a();
 failed_a:
   return 1;
}
