# WeMate
A simple zero level chat website made with ASP.NET Form and SQL Server as Backend service.

**_[Don't expect good architecture or much more security or much features. As I mentioned it is for zero level. I built it when I was newbie in the programming world]_**

## Video Demo
* [Youtube Link](https://www.youtube.com/watch?v=4zACchQ797o)

## Features
* Registration Page.
* Login Page.
* Chat Page.
* Master Page.
* A secret Admin Page [But Not much Secure. LOL!]


## Installation
If you want to run this project on your PC.

1. Make a Database named `UserDB`.

2. Run `FullSQLScript.sql` to your database which is provided with the source code (Under SQL Folder). 

3. Setup `ConnectionString`:

    ```Csharp
    connectionString = "Server=##Server-Name##; Database=##DATABASE-NAME##; User ID=##USER-ID##;Password=##Password## ;Integrated Security=True;"
    ```
    * Replace the all `##All-content##` with your one.
    * If you want `Windows Authentication`, remove `User ID` & `Password`.
    * If you want `SQL Server Authentication`, you can remove `Integrated Security=True`.
    * Example: (in my case)
    ```csharp
    connectionString = "Server=RITWICK\LOCALSQLSERVER; Database=UserDB; User ID=sa; Password=********" 
    ```

4. Fill Up the connectionString to `Web.Config`.


5.	And All setup is completed, Lets run it :)

<br>

>*[If you're having any trouble to setup, contact with me. I'll happy to help you.]*



## LICENSE

[MIT License](LICENSE)
