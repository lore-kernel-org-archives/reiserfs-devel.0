From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiserfsck can't fix FS - part 2
Date: Thu, 22 Dec 2005 17:38:12 +0300
Message-ID: <43AABA54.1040404@namesys.com>
References: <1129303303.3370.4.camel@desktop>                 <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>                 <b14e81f00510201255x3ee436afveb8222f43f69f8a@mail.gmail.com>                 <10442.195.137.105.19.1134285670.squirrel@195.137.105.19>                 <f18a8d980512121022j614f431dv62adbbc3caf5a6eb@mail.gmail.com>                 <b14e81f00512121415j3c415d45q5cdbeadd149d2eab@mail.gmail.com>                <f18a8d980512121454q5170cc19i31c9aa3d653226fe@mail.gmail.com>             <46071.213.249.155.231.1134648585.squirrel@213.249.155.231>             <43A170D7.1070705@namesys.com>          <10772.195.137.105.19.1134678241.squirrel@195.137.105.19>          <43A27033.1060109@namesys.com>       <10157.195.137.105.19.1134746087.squirrel@195.137.105.19>       <43A67E61.4020702@namesys.com>    <10376.195.137.105.19.1135063487.squirrel@195.137.105.19>    <43A7BD
 74.8020305@namesys.com> <10925.195.137.105.19.1135259740.squirrel@195.137.105.19>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <10925.195.137.105.19.1135259740.squirrel@195.137.105.19>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: lordvan@lordvan.com
Cc: reiserfs-list@namesys.com

Hello

Thomas Raschbacher wrote:
> hmm.. "safe links" ?? u as in 'ln' ?
> 

no. "safe links" are internal reiserfs things which indicate that there is
something which has to be done with filesystem on mount. In your case crash
happens handling those safe links.  Stack trace also shows that xattr code is
involved.

> i can recompile my kernel anytime .. 

Please recompile the kernel without xattr. If mount will work - then we have
figured out that something is wrong with xattrs removal.

> i'll just feel a lot better if i get
> a chance to back up my > 8GB digital photographs first .. :D

You said that you mounted it read-only. Were you able to read the data?
