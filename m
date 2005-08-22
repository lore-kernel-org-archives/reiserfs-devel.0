From: Michael James <Michael.James@csiro.au>
Subject: Re: reiser4 sending process to D state
Date: Mon, 22 Aug 2005 11:41:32 +1000
Message-ID: <200508221141.32201.Michael.James@csiro.au>
References: <43012902.1010600@webalive.biz> <4303D5CC.8000704@webalive.biz> <430843A8.9070301@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25601-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430843A8.9070301@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Sun, 21 Aug 2005 07:04 pm, Vladimir V. Saveliev wrote:

> well, it looks like there is some problem in
> interaction between Fusion scsi driver and reiser4. 
> Nate <nate.diller@gmail.com> has the same problem on this hardware.
> 
> Would you please try reiser4 on ide harddrive to confrm this guess?

I can't get reiser4 to work and it's on a fusion disk too.
Trouble is, it's a blade server no IDE, no PCI.

This was using stock Suse 9.3 Pro modules.
(I'm sorry Hans, I haven't had time to try kernel.org.
  I have a lot of faith in the Suse provided ones.)

See my earlier thread, "Trouble with Suse9.3's reiser4"

michaelj

-- 
Michael James                         michael.james@csiro.au
System Administrator                    voice:  02 6246 5040
CSIRO Bioinformatics Facility             fax:  02 6246 5166

No matter how much you pay for software,
 you always get less than you hoped.
Unless you pay nothing, then you get more.
