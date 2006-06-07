From: PFC <lists@peufeu.com>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Wed, 07 Jun 2006 19:21:31 +0200
Message-ID: <op.tasc55h6cigqcu@apollo13>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero> <1149604706.6389.40.camel@tribesman.namesys.com> <20060606153035.GF10672@HAL_5000D> <op.taqjp6bvcigqcu@apollo13> <4485D6E0.8090406@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-28757-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4485D6E0.8090406@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: reiserfs-list@namesys.com


>>     Do the file copying programs open their output files with
>> O_SEQUENTIAL ?  If so, there is information to exploit...
>>
>>
> You can change them to do so....

	I rather meant : if a program opens a file for write with O_SEQUENTIAL  
(which should be done when copying files), will reiser4 exploit the  
information by flushing sooner, and in a more "streaming" fashion ? Or  
will it use the default algorithm, flushing under memory pressure ?

	The current behaviour of reiser4, flushing dirty pages late in case they  
are modified again before being written, is excellent for many use cases  
(random writes, small file writes, temporary files, copying files inside a  
single spindle etc) ; but it isn't optimal for writing large amounts of  
data in sequential fashion, like copying large files between disks, for  
instance. Adapting this would be quite tricky I guess...

	Consider the two following scenarios :

	- A database is doing an UPDATE query on a table. It will issue a lot of  
reads and writes, probably in random order. In this case, if the working  
set fits in RAM, it pays big time to flush as late as possible, ideally  
when the query is finished, because some pages may be written to multiple  
times. Also, delayed allocation will reduce fragmentation of the files.
	It's the same thing for doing a Make, unzipping an archive, copying many  
small files, etc.

	- A process acquires audio or video in realtime and streams it to disk,  
or copies files from one disk to another. In this case it is better to  
stream the data directly to disk, especially if the files are large.

	Guessing is a pain in the ass. How can the application inform the  
filesystem of its intentions ?


