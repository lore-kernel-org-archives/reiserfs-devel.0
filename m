From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfs max file test
Date: Tue, 11 Apr 2006 12:43:50 +0400
Message-ID: <1144745030.6188.20.camel@tribesman.namesys.com>
References: <bfe179c00604101134k4663c745qf39cb1d576db702d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28475-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <bfe179c00604101134k4663c745qf39cb1d576db702d@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dan Sheffner <dsheffner@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Mon, 2006-04-10 at 13:34 -0500, Dan Sheffner wrote:
> Hello All,
> 
>  
> I'm trying to find out the number of files that reiserfs can support
> in a single folder.  I know that you web site says about 1.2 million
> files without collision, but I have written a small program to create
> files in order and so far I have been able to create about 10 million
> files in one directory.  Can you explain collision more? 

Everything depends on names of files you create. Reiserfs calculates a
key for each directory entry based on a file name. Currently a directory
can not have more than 128 names which identical keys. Probably in your
test names are such that the problem did not come up yet on that amount
of files.

> Here is the program I used below to test my theory.  I echo out hello
> 10 times to each file to give some size. My linux distro is GENTOO
> 2006.0 version and I'm running kernel 2.16.15
>  
>  
> #!/bin/bash 
> 
> LIMIT=10000000 # Upper limit of 10 million files 
> echo 
> echo "creating $LIMIT files for test" 
> a=0 
> 
> while [ $a -le "$LIMIT" ] 
> do 
> echo $a 
> a=$(($a+1)) 
> touch /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> echo "HELLO" >> /home/thesheff17/installServer/file/file$a.txt 
> done
>  
>  
> Below is the find command that tells me how many files are in the
> directory.  
>  
> production / # find /home/thesheff17/installServer
> /file/ \! -type d | wc -l
> 10000001
> production / #

