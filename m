From: Harald Radke <harryrat@gmx.de>
Subject: resize_reiserfs probs
Date: Mon, 23 Jun 2003 01:32:08 +0200
Message-ID: <200306230132.08812.harryrat@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14653-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi there!

Silly me, I installed a linux system via the internet and realize I need 
another partition right now.

Currently there is a swap, a small 16Meg (/boot - ext2) and a 3rd partition (/ 
- reiserfs), consuming all other disc space...

now I wanted to resize the root partition (booted with discs, so it wasn't 
mounted) from approx 9.5 to 9.2 GB.

however, resize_reiserfs stops with:

"resize_reiserfs: can't shrink fs; too many blocks already allocated"

strange, as partition has only approx. 1.6 GB data on it

Any hints?

(resize_reiserfs version is 3.6.4.)

T.I.A.

Harry
