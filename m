From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: immutability
Date: Sun, 30 May 2004 22:13:43 +0300
Message-ID: <20040530191343.GA4990@nysv.org>
References: <20040529152153.GA20663%alexy.khrabrov@setup.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18920-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040529152153.GA20663%alexy.khrabrov@setup.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alexy Khrabrov <list+reiserfs@setup.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Sat, May 29, 2004 at 11:21:54AM -0400, Alexy Khrabrov wrote:

>So, just to confirm -- is there chattr or a similar way to make files
>immutable?  I use a RAID to store digital photographs, running LVM on

Write a plugin:
echo 1 > ..metas/plugin/immutable

;)

-- 
mjt

