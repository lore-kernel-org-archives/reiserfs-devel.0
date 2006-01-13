From: Jonathan Sailor <jsailor@jesnetplus.com>
Subject: Re: Authoring a versioning plugin
Date: Fri, 13 Jan 2006 18:00:26 -0500 (EST)
Message-ID: <Pine.LNX.4.64.0601131758210.8337@gentoo.grakker.jesnetplus.com>
References: <200601111759.14638.fred@lab.matcom.uh.cu> <200601121014.37940.pvh@uvic.ca>
 <43C80EC3.7050003@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C80EC3.7050003@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Peter van Hardenberg <pvh@uvic.ca>, reiserfs-list@namesys.com, Yoanis Gil Delgado <fred@lab.matcom.uh.cu>

On Fri, 13 Jan 2006, Hans Reiser wrote:
>> I imagine that attribute should be
>> $ echo "1" > myfile.txt/..../plugins/versioning
>> or
>> $ echo "everywrite" > myfile.txt/..../plugins/versioning
>>
>> Unfortunately, my experience is that you cannot use "echo" to change the data
>> in the plugins/* pseudoplugins, even when it should be legal to do so. I just
>> had a little ruby script that looked roughly like this:
>>
>> f = open pseudofile;
>> f.write('newplugin');
>> f.close;
>>
>> Never had the time to figure out why that was necessary, but there it is.
>> (There is a comment on the plugin-wiki gotchas section.)
>>
>>
> If someone figures out why we can't do it but /proc can, or even fixes
> it, it would be good.

It wouldn't be something so simple as echo's trailing newline, would it?

-Jonathan
