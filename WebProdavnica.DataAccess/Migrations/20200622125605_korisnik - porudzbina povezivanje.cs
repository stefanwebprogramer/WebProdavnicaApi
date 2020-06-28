using Microsoft.EntityFrameworkCore.Migrations;

namespace WebProdavnica.DataAccess.Migrations
{
    public partial class korisnikporudzbinapovezivanje : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Porudzbine_Korisnici_KorisnikId",
                table: "Porudzbine");

            migrationBuilder.AddForeignKey(
                name: "FK_Porudzbine_Korisnici_KorisnikId",
                table: "Porudzbine",
                column: "KorisnikId",
                principalTable: "Korisnici",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Porudzbine_Korisnici_KorisnikId",
                table: "Porudzbine");

            migrationBuilder.AddForeignKey(
                name: "FK_Porudzbine_Korisnici_KorisnikId",
                table: "Porudzbine",
                column: "KorisnikId",
                principalTable: "Korisnici",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }
    }
}
