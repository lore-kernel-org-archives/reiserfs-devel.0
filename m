From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: fatal "not directory found" error at pass 3a of reiserfsck
Date: Tue, 14 Mar 2006 22:18:26 +0300
Message-ID: <200603142218.26428.vitaly@namesys.com>
References: <4416E66D.4020500@knaff.lu>
Reply-To: vitaly@namesys.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28253-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4416E66D.4020500@knaff.lu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alain Knaff <alain@knaff.lu>

On Tuesday 14 March 2006 18:51, Alain Knaff wrote:
> We have a corrupted reiserfs filesystem here which can't even be repaired with 
> --rebuid-tree.
> 
> The error messages happens at pass 3a:
> 
> 
> Pass 3a (looking for lost dir/files):
> ####### Pass 3a (lost+found pass) #########
> Looking for lost directories:
> lost+found.c 116 _look_for_lost
> not directory found
> Aborted
> 
> 
> What can we do to retrieve our files?

this seems to be fixed already.
sending the fixed reiserfsprogs version in the next email.

-- 
Vitaly
