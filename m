From: Jeffrey Yasskin <jyasskin@mail.utexas.edu>
Subject: Re: software packaging and ReiserFS v4
Date: Thu, 04 Sep 2003 00:05:04 -0500
Message-ID: <3F56C800.4050108@mail.utexas.edu>
References: <20030903165409.GD4714@rahul.net> <3F565A8F.4010209@botz.org> <20030903213742.GA13146@rahul.net> <3F566284.40406@botz.org> <20030904012846.GA1825@rahul.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15543-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030904012846.GA1825@rahul.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com



Bennett Todd wrote:

>2003-09-03T17:52:04 J?rgen Botz:
>  
>
>>Bennett Todd wrote:
>>    
>>
>>>>>(although the forward mappings within /var/lib/pkg/foo wouldn't
>>>>>update automagically).
>>>>>          
>>>>>
>>>>They could, with the right plug-in.
>>>>        
>>>>
>>>A plug-in to reach in and edit the forward references in the package
>>>database misses my vision of "simple";
>>>      
>>>
>>There is no need for a separate "package database" with your
>>scheme.  What is the package database but the contents of your
>>'pkg' directory?
>>    
>>
>
>The package database is the contents of /var/lib/pkg/ --- files,
>each nearly completely documenting one package, with addenda as
>needed under each --- plus the symlinks under each installed file
>back representing the inverse map.
>
>  
>
>>Your links (/usr/bin/program/pkg -> /pkg/program/...) provide the
>>inversion.  You only need a plug-in to make this "symbolic link"
>>something that gets atomically changed at both ends.
>>    
>>
>
>The problem is that the forward maps aren't a symlink, they're text
>files enumerating the contents of the package together with
>attributes (is this a doc file, a config file, ...) and the
>checksums table (a text file, w/ full pathnames and sha1 sums in
>hex); that last usually signed by a detached OpenPGP sig.
>  
>
I think you want the bidirectional links which are mentioned in the Link 
Taxonomy section of http://namesys.com/v4/v4.html (search for "bilink"). 
I don't think they're implemented yet, but once they are, the forward 
map will probably consist of a pseudo-file (..links?) in /var/lib/pkg/foo/








--Jeffrey

