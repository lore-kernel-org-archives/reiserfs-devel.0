From: rvalles <rvalles@es.gnu.org>
Subject: Re: bad bread
Date: Sun, 7 May 2006 02:56:19 +0200
Message-ID: <40159.1422538788$1146963436@news.gmane.org>
References: <20060505062801.402beb50.boricua@despiertapr.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20060505062801.402beb50.boricua@despiertapr.com>
Sender: <tux@eww.ath.cx.>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: boricua@despiertapr.com

On Fri, May 05, 2006 at 06:28:01AM -0400, boricua wrote:
> running reiserfsck -B bbfile   /dev/hda4 is giving me following error
> 
> "bread: cannot read the block 16 [i/o error]
> 
> anyway aroound this?
> 
IO error means block-layer level failure, that is, physical failure.

In the event of physical HD failure, the procedure goes like this:

- get a bigger partition somewhere reachable (new hard disk, nfs,
  whatever)
- boot knoppix, use dd_rescue to dump as much as possible of faulty disk
  into a file on the bigger partition. Pad not recoverable zones with
  zeroes so that the pointers arent screwed up.
- run fsck on the image you created
- mount and recover.

Good luck.
-- 
- Do you study theories? - Oh yes! Theories are fun. - How do you use them? - When I must act, theories are too slow. To act, I must know.
