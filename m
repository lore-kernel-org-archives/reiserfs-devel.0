From: "David Dabbs" <david@dabbs.net>
Subject: RE: implementing reiserfs in C++ for a new OS
Date: Sat, 7 Aug 2004 21:11:10 -0500
Message-ID: <20040808021500.8250B15DA6@mail03.powweb.com>
References: <20040808020024.746D415C29@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040808020024.746D415C29@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'ReiserFS List' <reiserfs-list@namesys.com>
Cc: 'Ramachandra K' <ariston@gmail.com>


> 
> I am planning to implement ReiserFS on my operating system named Capital
> (www.mitpune.com/research/capital1.html). To give a brief background -
> Capital is a 32-bit Object Oriented operating system for the Intel
> i386 range of microprocessors. Capital's features include
> multithreading,virtual memory and a VFS interface.
>
> 
> rgds
> Ram

Ram,

Based upon your project description, you might be better served by talking
to the folks in IBM's K42 OS project. K42's filesystem, kfs, seems similar
in philosophy to Reiser4, though to learn more you'll need to get on their
list and read the code. The short kfs overview isn't meaty enough. Their
team has tackled most of the work of providing a Linux API 'personality' for
the OS kernel.  The project is implemented in C++ and was built from the
ground up to run (and scale) on modern, cache-coherent multiprocessor
machines. See the K42 OS Home Page: http://www.research.ibm.com/K42/

Also of interest to file system designers will be (more at the home page)

KFS: Exploring Flexibility in File System Design 
http://www.research.ibm.com/K42/papers/wsoBrazil2004.pdf
Dilma Da Silva, Livio Soares, Orran Krieger, "KFS: Exploring Flexibility in
File System Design", to appear in the Brazilian Workshop on Operating
Systems (WSO'2004), Salvador, Brazil, August 2004.

Meta-data Snapshotting: A simple mechanism for File System Consistency 
http://www.research.ibm.com/K42/papers/snapi03.pdf
Livio Soares, Orran Krieger, Dilma Da Silva, "Meta-data Snapshotting: A
simple mechanism for File System Consistency", SNAPI'03 (International
Workshop on Storage Network Architecture and Parallel I/O).


Good luck,

David




