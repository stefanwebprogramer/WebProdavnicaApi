using Microsoft.EntityFrameworkCore.Migrations;

namespace WebProdavnica.DataAccess.Migrations
{
    public partial class dodatacenaustavkuporudzbine : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<decimal>(
                name: "Cena",
                table: "StavkePorudzbine",
                nullable: false,
                defaultValue: 0m);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "Cena",
                table: "StavkePorudzbine");
        }
    }
}
