From: Tupshin Harper <tupshin@tupshin.com>
Subject: Re: Reiser4 status: benchmarked vs. V3 (and ext3)
Date: Thu, 24 Jul 2003 14:10:19 -0700
Message-ID: <3F204B3B.3040802@tupshin.com>
References: <3F1EF7DB.2010805@namesys.com>	<1059062380.29238.260.camel@sonja> <16160.4704.102110.352311@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15041-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16160.4704.102110.352311@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Daniel Egger <degger@fhm.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel@vger.kernel.org, reiserfs mailing list <reiserfs-list@namesys.com>

Nikita Danilov wrote:

>Daniel Egger writes:
> > 
> > How failsafe is it to switch off the power several times? When the
> > filesystem really works atomically I should have either the old or the
> > new version but no mixture. Does it still need to fsck or is the
> > transaction replay done at mount time? In case one still needs fsck,
> > what's the probability of needing user interaction? How long does it
> > need to get a filesystem back into a consistent state after a powerloss
> > (approx. per MB/GB)?
>
>I should warn everybody that reiser4 is _highly_ _experimental_ at this
>moment. Don't use it for production.
>
I'd like to ask this question differently: How failsafe is reiserfs4 
*theoretically*. Assuming no bugs in implementation, what is the true 
import of its atomic nature? Strengths and potential weaknesses?

-Thanks
-Tupshin

