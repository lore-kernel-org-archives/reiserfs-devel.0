From: Grant Miner <mine0057@mrs.umn.edu>
Subject: Re: software packaging and ReiserFS v4
Date: Fri, 05 Sep 2003 13:15:41 -0500
Message-ID: <3F58D2CD.3050801@mrs.umn.edu>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030903213742.GA13146@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bennett Todd <bet@rahul.net>, reiserfs-list@namesys.com

If you are making a packaging system, I recommend you do not allow 
scipts, since they open up a whole can of worms.  (They're impossible to 
invert, introduce security problems, make additional work for GUI 
package managers, and cause too many problems.)

