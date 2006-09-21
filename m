From: Huub <huubvanniekerk@gmail.com>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 12:19:01 +0200
Message-ID: <eetoul$kq6$1@sea.gmane.org>
References: <eet9jg$463$1@sea.gmane.org> <200609211350.58135.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29957-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609211350.58135.vs@namesys.com>
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>
> 
> being booted off boot-dvd, please, run reiserfsck for partitions which were formatted as reiserfs and
> let us see reiserfsck' output.
> 

"fdisk /dev/hdc" shows that I have:

/dev/hdc1	Linux swap
/dev/hdc2 *	Linux
/dev/hdc3	Linux

As I stated in my own response, error 17 means it doesn't recognize a 
partition as being ReiserFS. Should I do "reiserfsck /dev/hdc2" anyway?

