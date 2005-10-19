From: "Thomas Raschbacher" <lordvan@lordvan.com>
Subject: Re: Reiserfsck can't fix FS
Date: Wed, 19 Oct 2005 12:27:42 +0100 (BST)
Message-ID: <53246.213.249.155.242.1129721262.squirrel@213.249.155.242>
References: <1129303303.3370.4.camel@desktop> 
    <200510142008.42253.vitaly@namesys.com> 
    <1129484435.16949.1.camel@desktop>
    <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>
Reply-To: lordvan@lordvan.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26567-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f00510171234l4addda48kf73e962b384be6e6@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Actually I did send it SIGUSR1 signals to get the progress so it really
seems to work fine.
I intend to get another HDD (internal) and see if i can copy the FS and
then fix it there.
how would I best copy the filesystem? DD ?
(The PRoblems I had before with this disc are USB-storage related where
the disc does stop working if one reads/writes too much data at once on
USB2)

-- 
-----BEGIN GEEK CODE BLOCK-----
GCS/CC/E/M/MU/S d- s: a--- C++++(++) UL++++ P+ L++++ E W+++ N+++ o-- K w-- O
M-- V- PS+ PE-- Y++ PGP+++ t+++ 5+ X- R tv b++++ DI- D+ G++ e-->+++++ h-- !r
z-
------END GEEK CODE BLOCK------

On Mon, October 17, 2005 20:34, michael chang said:
> On 10/16/05, Thomas Raschbacher <lordvan@lordvan.com> wrote:
>> Hi
>>
>> just a quick addition:
>>
>> I ran this:
>>
>> desktop lordvan # dd if=/dev/discs/disc2/part6  of=/dev/null bs=8k
>> 1192384+0 records in
>> 1192384+0 records out
>> 1209296+0 records in
>> 1209296+0 records out
>> 1275725+0 records in
>> 1275725+0 records out
>> 1326505+0 records in
>> 1326505+0 records out
>> 1790232+0 records in
>> 1790232+0 records out
>> 2255571+0 records in
>> 2255571+0 records out
>> 2447343+0 records in
>> 2447343+0 records out
>> 6220163+1 records in
>> 6220163+1 records out
>>
>> as you see it produced no errors at all so the HDD can be read fine. any
>> idea what could cause the problem?
>
> IIRC, if there were no errors, dd wouldn't have repeatedly told you
> what records in/out it'd completed, unless you manually tell it to do
> so.
>
> If you didn't touch it and it's saying this, then dd is skipping over
> some dysfunctional blocks.  Otherwise, then yes, dd can read it fine
> (although that doesn't say anything about the data's integrity).
>
> --
> ~Mike
>  - Just my two cents
>  - No man is an island, and no man is unable.
>


