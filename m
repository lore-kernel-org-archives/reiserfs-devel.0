From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs logging patches udpated
Date: Wed, 24 Mar 2004 15:06:55 -0500
Message-ID: <1080158815.14737.112.camel@watt.suse.com>
References: <1080149399.14737.77.camel@watt.suse.com>
	 <87ekrim3eo.fsf@uhoreg.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17440-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87ekrim3eo.fsf@uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On Wed, 2004-03-24 at 14:49, Hubert Chan wrote:
> >>>>> "Chris" == Chris Mason <mason@suse.com> writes:
> 
> [...]
> 
> Chris> - add reiserfs laptop mode support
> 
> Can you explain what laptop mode is?

Take a look at linux/Documentation/laptop-mode.txt on any recent -mm
kernel.

The short description is that it allows you to force the filesytem into
a mode where it doesn't flush things to disk.  The risk is increased
loss of data if you crash, the gain is better battery life on laptops. 
The docs include a sample control script and other details.

The reiserfs patch is quite small, just making sure the journal honors
the flush timings requested by the rest of the kernel.

-chris


