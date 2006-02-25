From: Brian Meidell <brian@mindflow.dk>
Subject: Re: creating live virtual files by concatenation
Date: Sat, 25 Feb 2006 16:28:02 +0100
Message-ID: <44007782.2010608@mindflow.dk>
References: <1271316508.20060225153749@dns.toxicfilms.tv>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1271316508.20060225153749@dns.toxicfilms.tv>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: reiserfs-list@namesys.com


I think the idea sounds like a special case of what can - if I 
understand it correctly - be done with  plugins for reiser4.

I have absolutely no practical knowledge of reiserfs plugins, but I 
remember the example with having the ID3 tag in an mp3 file be 
accessible through the file system by use of plugins. If that can be 
done, your suggestions could be done as well.

Feel free to hit me over the head with the stupid-newbie stick if I am 
way off - I am completely new to this list and I joined it to get smarter.

/Brian Meidell

Maciej Soltysiak wrote:
> Hello!
>
> I have this idea about creating sort of a virtual file.
>
> Let us say I have three text files that contain javascript code:
> tooltip.js
> banner.js
> foo.js
>
> Now let us say I am creating sort of a virtual text file (code.js)
> that is a live-concatenation of these files:
> # concatenate tooltip.js banner.js foo.js code.js
>
> Note I am not talking about the cat(1) utility. I am thinking of
> code.js be always a live concatenated version of these three, so when
> I modify one file, the live-version is also modified.
>
> What puprose I might have? Network-related. Say, I have an HTML file
> that includes these three files in its code.
>
> When a browser downloads the HTML file it will then create three threads
> to download each of those javascript files.
>
> If I had a live-concatenated file, I could reference it in the HTML file
> so that the browser does not have to download three files but just one.
>
> This would surely reduce network overhead of downloading the same amount
> of data but within just one connection, reduce resource usage on the client
> and possibly (depending on implementation) reduce the cost of accessing
> three individual files on the server.
>
> I am CC'ing reiserfs-list because Reiser4 would seem to be the most
> robust filesystem that could have it done.
>
> Any thoughts about the idea itself?
> Would be nice if this idea could inspire some talented hackers here and there.
>
> Best Regards,
> Maciej
>
>
>
>
>   
