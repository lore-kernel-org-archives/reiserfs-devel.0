From: Claudio Martins <ctpm@ist.utl.pt>
Subject: Re: Atomic filesystem or not
Date: Thu, 15 Jul 2004 13:54:47 +0100
Message-ID: <200407151354.47063.ctpm@ist.utl.pt>
References: <200407151434.23082.marcel@hilzinger.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407151434.23082.marcel@hilzinger.hu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Marcel Hilzinger <marcel@hilzinger.hu>


On Thursday 15 July 2004 13:34, Marcel Hilzinger wrote:
> I tried to do a crash-test with Reiser4. I copied a 650 MB file from
> directory A to directory B and pressed the reset buttom at approx 300 MB
> (the testmachine has 256 MB RAM).
>
> After reboot the 300 MB chunk was still in B.
> I thougt it should be either there full or not at all? Or did I understand
> something wrong? Does it work only with files < RAM? What's the difference

  You did understand something wrong ;-)

  A copy using the Unix cp command is not an atomic operation per se. When it 
is said that reiser4 is atomic what it means is that each low level operation 
on the filesystem either happens or not at all. That means that each block 
write request issued by cp either happens or not, but the entire 650MB copy 
itself is composed of many separate atomig requests.

  So what you shouldn't see on the half copied file is blocks which contain 
zeros or otherwise garbage data that didn't belong to the original file (as 
somethimes happens on other journalling filesystems, reiserfs 3.6 sometimes 
included). If you check the differences between the files, they should 
contain the same data up to the last block that hit disk surface before you 
pressed the reset button. 

  As far as I understand this is the guarantee that reiser4 gives. For the cp 
to happen entirely or not at all it would have to be one big atomic request 
only, but I think that kind of operation might only be possible using the 
special reiser4 system call in development.

Best regards

Claudio


> then?
>
> Marcel

